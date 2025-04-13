package servicesImpl;

import models.Permission;
import repositoriesImpl.PermissionRepositoryImpl;
import services.IPermissionService;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class PermissionServiceImpl implements IPermissionService {

    private final PermissionRepositoryImpl permissionRepository;

    public PermissionServiceImpl(PermissionRepositoryImpl permissionRepository) {
        this.permissionRepository = permissionRepository;
    }

    @Override
    public List<Permission> getAll() {

        return this.permissionRepository.getAll();
    }


    public Map<String, List<Permission>> getPermissionsGroupedByModule() {
        List<Permission> all = this.getAll();

        return all.stream()
                .collect(Collectors.groupingBy(Permission::getModule));
    }
}
