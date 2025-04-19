package enums;

public enum RoutePermission {
    CATEGORY_MANAGEMENT("/admin/category", "category.view"),
    CATEGORY_ADD("/admin/category?action=add", "category.add"),
    CATEGORY_EDIT("/admin/category?action=edit", "category.edit"),
    CATEGORY_DELETE("/admin/category?action=delete", "category.delete"),

    DEPARTMENT_MANAGEMENT("/admin/department", "department.view"),
    DEPARTMENT_ADD("/admin/department?action=add", "department.add"),
    DEPARTMENT_EDIT("/admin/department?action=edit", "department.edit"),
    DEPARTMENT_DELETE("/admin/department?action=delete", "department.delete"),

    QUESTION_MANAGEMENT("/admin/question", "question.view"),
    QUESTION_ADD("/admin/question?action=add", "question.add"),
    QUESTION_EDIT("/admin/question?action=edit", "question.edit"),
    QUESTION_DELETE("/admin/question?action=delete", "question.delete"),
    QUESTION_REJECT("/admin/question?action=reject", "question.reject"),
    QUESTION_ANSWER("/admin/question?action=answer", "question.answer"),

    ROLE_MANAGEMENT("/admin/role", "role.view"),
    ROLE_ADD("/admin/role?action=add", "role.add"),
    ROLE_EDIT("/admin/role?action=edit", "role.edit"),
    ROLE_DELETE("/admin/role?action=delete", "role.delete"),

    USER_MANAGEMENT("/admin/user", "user.view"),
    USER_ADD("/admin/user?action=add", "user.add"),
    USER_EDIT("/admin/user?action=edit", "user.edit"),
    USER_DELETE("/admin/user?action=delete", "user.delete");


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

