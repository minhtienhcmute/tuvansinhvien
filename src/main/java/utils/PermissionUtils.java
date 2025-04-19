package utils;

import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

public class PermissionUtils {
    public static void setPermissionFlags(HttpServletRequest request, List<String> userPermissions) {
        String path = request.getServletPath();
        String action = request.getParameter("action");

        if (path == null) return;

        // Lấy tên module từ path: /admin/category → category
        String module = path.replace("/admin/", "");

        boolean canAdd = userPermissions.contains(module + ".add");
        boolean canEdit = userPermissions.contains(module + ".edit");
        boolean canDelete = userPermissions.contains(module + ".delete");
        boolean canAnswer = userPermissions.contains(module + ".answer");
        boolean canReject = userPermissions.contains(module + ".reject");

        request.setAttribute("canAdd", canAdd);
        request.setAttribute("canEdit", canEdit);
        request.setAttribute("canDelete", canDelete);
        request.setAttribute("canAnswer", canAnswer);
        request.setAttribute("canReject", canReject);
    }
}
