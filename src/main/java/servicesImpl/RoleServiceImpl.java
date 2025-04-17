package servicesImpl;

import models.Role;
import repositoriesImpl.RoleRepositoryImpl;
import services.IRoleService;

import java.sql.SQLException;
import java.util.List;

public class RoleServiceImpl implements IRoleService {

    private final RoleRepositoryImpl roleRepository;

    public RoleServiceImpl(RoleRepositoryImpl roleRepository) {
        this.roleRepository = roleRepository;
    }

    public void deleteRole(int roleId) throws SQLException {
        roleRepository.delete(new Role(roleId));
    }

    public void updateRole(int roleId, String roleName) throws SQLException {
        Role role = new Role(roleId, roleName);
        this.roleRepository.update(role);
    }

    public int addRole(String roleName) throws SQLException {
        Role role = new Role(roleName);
        return this.roleRepository.add(role);
    }

    public Role getRoleById(int roleId) throws SQLException {

        return this.roleRepository.getById(roleId);
    }

    public List<Role> getRoles() {
        return this.roleRepository.getAll();
    }

    public List<Role> getAllRoles() {
        List<Role> roles = roleRepository.getAll();

        // Group permissions theo module
//        for (Role role : roles) {
//            // Group permissions của mỗi role theo module
//            Map<String, List<Permission>> groupedPermissions = role.getPermissions().stream()
//                    .collect(Collectors.groupingBy(Permission::getModule));
//        }

        return roles;
    }
}
