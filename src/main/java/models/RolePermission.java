package models;

public class RolePermission {
    private int role_id;
    private int permission_id;

    public void setRoleId(int role_id) {
        this.role_id = role_id;
    }

    public void setPermissionId(int permission_id) {
        this.permission_id = permission_id;
    }

    public int getRoleId() {
        return role_id;
    }

    public int getPermissionId() {
        return permission_id;
    }
}
