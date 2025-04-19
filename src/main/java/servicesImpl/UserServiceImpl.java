package servicesImpl;

import models.*;
import repositoriesImpl.RolePermissionRepositoryImpl;
import repositoriesImpl.UserDepartmentRepositoryImpl;
import repositoriesImpl.UserRepositoryImpl;
import repositoriesImpl.UserRoleRepositoryImpl;
import services.IUserService;
import utils.DBConnectionPool;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements IUserService {

    private final UserRepositoryImpl userRepository;
    private final UserRoleRepositoryImpl userRoleRepository;
    private final UserDepartmentRepositoryImpl userDepartmentRepository;
    private final RolePermissionRepositoryImpl rolePermissionRepository = new RolePermissionRepositoryImpl();


    public UserServiceImpl(UserRepositoryImpl userRepository, UserRoleRepositoryImpl userRoleRepository, UserDepartmentRepositoryImpl userDepartmentRepository) {
        this.userRoleRepository = userRoleRepository;
        this.userDepartmentRepository = userDepartmentRepository;
        this.userRepository = userRepository;
    }

    public boolean hasPermission(User user, String requiredPermission) {
        // Kiểm tra nếu user hoặc requiredPermission là null, trả về false
        if (user == null || requiredPermission == null) {
            return false;
        }

        // Lặp qua các vai trò của user
        for (Role role : user.getRoles()) {
            for (Permission permission : role.getPermissions()) {
                if (permission.getCode().equals(requiredPermission)) {
                    return true; // Nếu tìm thấy quyền trùng, trả về true
                }
            }
        }

        return false; // Nếu không tìm thấy quyền nào trùng, trả về false
    }

    public void assignPermissionsToUserRoles(User user) throws SQLException {
        if (user == null || user.getRoles().isEmpty()) return;

        List<Integer> roleIds = user.getRoles().stream().map(Role::getId).toList();

        Map<Integer, List<Permission>> permissionMap = rolePermissionRepository.getPermissionsByRoleIds(roleIds);

        for (Role role : user.getRoles()) {
            List<Permission> permissions = permissionMap.getOrDefault(role.getId(), new ArrayList<>());
            role.setPermissions(permissions);
        }
    }

    public void deleteUser(String userId) throws SQLException {
        User user = new User();
        user.setId(Integer.parseInt(userId));
        this.userRepository.delete(user);
    }

    public List<User> getUsersWithRelations() throws SQLException {
        return this.userRepository.getAllWithRelations();
    }

    public User getUserByEmail(String email) throws SQLException {
        return this.userRepository.getUserByEmail(email);

    }

    public User getUser(int id) throws SQLException {
        return this.userRepository.getUserById(id);
    }

    public void updateUserWithRelations(User user, String[] roleIds, String[] departmentIds) throws SQLException {
        Connection conn = null;

        try {
            conn = DBConnectionPool.getConnection();
            conn.setAutoCommit(false);
            if (user.getPassword() != null) {
                // Đã được hash ở Servlet, chỉ cần gọi update có password
                userRepository.updateUserHavePassword(conn, user);
            } else {
                // Không có password, gọi update không có password
                userRepository.updateUserWithoutPassword(conn, user);
            }
            int userId = user.getId();
            userRoleRepository.deleteUserRoleUserId(conn, new UserRole(userId));
            userDepartmentRepository.deleteUserDepartmentByUserId(conn, new UserDepartment(userId));

            if (roleIds != null && roleIds.length > 0) {
                List<UserRole> userRoles = createUserRoles(userId, roleIds);
                userRoleRepository.insertBatchWithConnection(conn, userRoles);
            }

            if (departmentIds != null && departmentIds.length > 0) {
                List<UserDepartment> userDepartments = createUserDepartments(userId, departmentIds);
                userDepartmentRepository.insertBatchWithConnection(conn, userDepartments);
            }
            conn.commit();
        } catch (SQLException e) {
            if (conn != null) try {
                conn.rollback();
            } catch (SQLException ex) {
            }
            e.printStackTrace();
            throw e;
        } finally {
            if (conn != null) try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();

            }
        }
    }

    public void createUserWithRelations(User user, String[] roleIds, String[] deptIds) throws SQLException {
        Connection conn = null;

        try {
            conn = DBConnectionPool.getConnection();
            conn.setAutoCommit(false);

            int userId = userRepository.addWithConnection(conn, user);
            if (roleIds != null && roleIds.length > 0) {
                List<UserRole> userRoles = createUserRoles(userId, roleIds);
                userRoleRepository.insertBatchWithConnection(conn, userRoles);
            }

            if (deptIds != null && deptIds.length > 0) {
                List<UserDepartment> userDepartments = createUserDepartments(userId, deptIds);
                userDepartmentRepository.insertBatchWithConnection(conn, userDepartments);
            }
            conn.commit();
        } catch (SQLException e) {
            if (conn != null) try {
                conn.rollback();
            } catch (SQLException ex) {
            }
            e.printStackTrace();
            throw e;
        } finally {
            if (conn != null) try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();

            }
        }
    }

    private List<UserRole> createUserRoles(int userId, String[] roleIds) {
        List<UserRole> userRoles = new ArrayList<>();
        for (String roleId : roleIds) {
            userRoles.add(new UserRole(userId, Integer.parseInt(roleId)));
        }
        return userRoles;
    }

    // Tạo danh sách UserDepartment từ userId và danh sách deptIds
    private List<UserDepartment> createUserDepartments(int userId, String[] deptIds) {
        List<UserDepartment> userDepartments = new ArrayList<>();
        for (String deptId : deptIds) {
            userDepartments.add(new UserDepartment(userId, Integer.parseInt(deptId)));
        }
        return userDepartments;
    }
}
