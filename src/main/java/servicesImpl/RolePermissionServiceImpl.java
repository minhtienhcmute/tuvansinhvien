package servicesImpl;

import models.Permission;
import models.RolePermission;
import repositoriesImpl.RolePermissionRepositoryImpl;
import services.IRolePermissionService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RolePermissionServiceImpl implements IRolePermissionService {

    private final RolePermissionRepositoryImpl rolePermissionRepository;


    public RolePermissionServiceImpl(RolePermissionRepositoryImpl rolePermissionRepository) {
        this.rolePermissionRepository = rolePermissionRepository;
    }

    //    public void deleteRolePermission(int roleId, List<String> permissionId) {
//        this.rolePermissionRepository.deleteByRoleAndPermissionIds(roleId, permissionId);
//    }
    public void deleteRolePermission(int roleId) throws SQLException {
        this.rolePermissionRepository.delete(new RolePermission(roleId));
    }

    @Override
    public List<Permission> getAll() {
        return List.of();
    }

    public void addBatch(int roleId, String[] permissions) throws SQLException {
        List<RolePermission> rolePermissions = new ArrayList<>();
        for (String permissionId : permissions) {
            rolePermissions.add(new RolePermission(roleId, Integer.parseInt(permissionId)));
        }

        this.rolePermissionRepository.insertBatch(rolePermissions);
    }
}
