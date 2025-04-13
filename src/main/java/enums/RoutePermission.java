package enums;

public enum RoutePermission {
    CATEGORY_VIEW("/admin/category", "category.view"),
    CATEGORY_ADD("/admin/category/add", "category.add"),
    CATEGORY_EDIT("/admin/category/edit", "category.edit"),
    CATEGORY_DELETE("/admin/category/delete", "category.delete"),
    DEPARTMENT_VIEW("/department", "DEPARTMENT_VIEW");

    private final String path;
    private final String permissionCode;

    RoutePermission(String path, String permissionCode) {
        this.path = path;
        this.permissionCode = permissionCode;
    }

    public String getPath() {
        return path;
    }

    public String getPermissionCode() {
        return permissionCode;
    }

    public static String getPermissionByPath(String path) {
        for (RoutePermission rp : values()) {
            if (rp.getPath().equals(path)) {
                return rp.getPermissionCode();
            }
        }
        return null;
    }
}

