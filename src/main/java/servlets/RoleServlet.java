package servlets;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Permission;
import models.Role;
import repositoriesImpl.PermissionRepositoryImpl;
import repositoriesImpl.RolePermissionRepositoryImpl;
import repositoriesImpl.RoleRepositoryImpl;
import servicesImpl.PermissionServiceImpl;
import servicesImpl.RolePermissionServiceImpl;
import servicesImpl.RoleServiceImpl;
import utils.BreadcrumbUtils;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet({"/admin/role"})

public class RoleServlet extends HttpServlet {
    private PermissionServiceImpl permissionService;
    private RoleServiceImpl roleService;
    private RolePermissionServiceImpl rolePermissionService;
    private final String breadcrumbTitle = "Role management";

    public void init() throws ServletException {
        this.permissionService = new PermissionServiceImpl(new PermissionRepositoryImpl());
        this.roleService = new RoleServiceImpl(new RoleRepositoryImpl());
        this.rolePermissionService = new RolePermissionServiceImpl(new RolePermissionRepositoryImpl());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "view";

        switch (action) {
            case "view":
                // show list
                String type = request.getParameter("type");
                String roleId = request.getParameter("id");

                if (roleId != null) {
                    handleViewDetail(request, response);
                }
//                if ("api".equals(type)) {
//                    handleViewApi(request, response); // trả JSON cho table
//                }
                else {

                    handleViewPage(request, response); // hiển thị trang JSP


                }
                break;
            case "add":
                handleAdd(request, response);
                break;
            case "edit":
                handleEdit(request, response);
                break;
            default:
                response.sendError(404);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("add".equalsIgnoreCase(action)) {
                String roleName = req.getParameter("name");
                String[] permissions = req.getParameterValues("permission[]");

                int roleIdInserted = this.roleService.addRole(roleName);
                this.rolePermissionService.addBatch(roleIdInserted, permissions);

                String msg = "Role " + roleName + " added";
                // Redirect về form add kèm message
                resp.sendRedirect(req.getContextPath() + "/admin/role?action=add&success=" + msg);
            } else if ("edit".equalsIgnoreCase(action)) {
                String roleId = req.getParameter("id");
                if (roleId != null) {
                    String roleName = req.getParameter("name");
                    String[] permissions = req.getParameterValues("permission[]");

                    this.roleService.updateRole(Integer.parseInt(roleId), roleName);
                    this.rolePermissionService.deleteRolePermission(Integer.parseInt(roleId));

                    this.rolePermissionService.addBatch(Integer.parseInt(roleId), permissions);

                    String message = "Cập nhật role thành công";
                    String encodedMsg = URLEncoder.encode(message, StandardCharsets.UTF_8);
                    resp.sendRedirect(req.getContextPath() + "/admin/role?action=edit&id=" + roleId + "&success=" + encodedMsg);
                }

            } else if ("delete".equalsIgnoreCase(action)) {
                String roleId = req.getParameter("id");
                if (roleId != null) {

                    this.roleService.deleteRole(Integer.parseInt(roleId));
                    String message = "Xóa role thành công";
                    String encodedMsg = URLEncoder.encode(message, StandardCharsets.UTF_8);
                    resp.sendRedirect(req.getContextPath() + "/admin/role" + "?success=" + encodedMsg);
                }
            }


//            JsonResponseUtil.sendSuccess(resp, "Tạo role và phân quyền thành công!");
        } catch (Exception e) {
            e.printStackTrace();

            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            String idParam = req.getParameter("id");

            String fallbackUrl = "add".equalsIgnoreCase(action)
                    ? "/admin/role?action=add&error=" + message
                    : "/admin/role?action=edit&id=" + idParam + "&error=" + message;

            resp.sendRedirect(req.getContextPath() + fallbackUrl);
//            JsonResponseUtil.sendError(resp, e.getMessage());
        }

    }

    private void handleViewDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageDesc = "View role";
        String[][] breadcrumbs = {
                {"Role list", "/admin/role"},
                {pageDesc, null},
        };
        request.setAttribute("breadcrumbTitle", breadcrumbTitle);
        request.setAttribute("cardTitle", pageDesc);
        request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));

        try {

            int roleId = Integer.parseInt(request.getParameter("id"));
            Role role = roleService.getRoleById(roleId);
            Map<String, List<Permission>> groupedPermissions = role.getPermissions()
                    .stream()
                    .collect(Collectors.groupingBy(Permission::getModule));

            request.setAttribute("groupedPermissions", groupedPermissions);
            request.setAttribute("contentPage", "/views/admin/role/index.jsp");
            request.setAttribute("view", "/views/admin/role/view-role.jsp");
            request.setAttribute("role", role);
            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "error=" + message);
        }

    }

    private void handleViewApi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int draw = Integer.parseInt(request.getParameter("draw"));
        int start = Integer.parseInt(request.getParameter("start"));
        int length = Integer.parseInt(request.getParameter("length"));

        // Prepare mock data
        String[][] roleData = {
                {"Admin", "Create, Edit, Delete, View"},
                {"User", "View"},
                {"Manager", "Create, View"},
                {"Editor", "Edit, View"},
                {"Viewer", "View"},
                {"Moderator", "Moderate, View"},
                {"SuperAdmin", "All"},
                {"Developer", "Develop, Edit"},
                {"Support", "Support"},
                {"HR", "Manage"}
        };

        // Calculate the number of records to return
        List<Map<String, String>> data = new ArrayList<>();
        int totalRecords = roleData.length;  // Total records in roleData

        // Loop over the data and return only the range requested (pagination)
        for (int i = start; i < Math.min(start + length, 50); i++) {
            String[] role = roleData[i];
            Map<String, String> roleMap = new HashMap<>();

            // Set key-value pairs for role_name and permissions
            roleMap.put("role_name", "role[0]");
            roleMap.put("permissions", "role[1]");

            // Add to the data list
            data.add(roleMap);
        }

        // DataTable format response
        int recordsTotal = 100;  // Total number of records
        int recordsFiltered = 100;  // Assuming no filter applied in this case

        // Create response JSON format
        DataTableResponse dataTableResponse = new DataTableResponse(draw, recordsTotal, recordsFiltered, data);

        // Convert to JSON using Gson
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(dataTableResponse);

        // Set response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Send response
        response.getWriter().write(jsonResponse);
    }

    private void handleViewPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<String, List<Permission>> groupedPermissions = permissionService.getPermissionsGroupedByModule();

        request.setAttribute("groupedPermissions", groupedPermissions);
        request.setAttribute("contentPage", "/views/admin/role/index.jsp");
        request.setAttribute("view", "/views/admin/role/view-list.jsp");
        List<Role> roleList = roleService.getRoles();
        request.setAttribute("roles", roleList);
        request.setAttribute("breadcrumbTitle", breadcrumbTitle);
        request.setAttribute("cardTitle", "Roles");

        request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: code thêm role
        try {
            String pageDesc = "Add role";
            String[][] breadcrumbs = {
                    {"Role list", "/admin/role"},
                    {pageDesc, null},
            };
            Map<String, List<Permission>> groupedPermissions = permissionService.getPermissionsGroupedByModule();
            request.setAttribute("groupedPermissions", groupedPermissions);
            request.setAttribute("contentPage", "/views/admin/role/index.jsp");
            request.setAttribute("view", "/views/admin/role/add-role.jsp");
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", pageDesc);
            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {

        }


    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: code sửa role
        String pageDesc = "Edit role";
        String[][] breadcrumbs = {
                {"Role list", "/admin/role"},
                {pageDesc, null},
        };

        try {
            String roleId = request.getParameter("id");

            if (roleId != null) {
                Role role = roleService.getRoleById(Integer.parseInt(roleId));

                Map<String, List<Permission>> currentPermissions = role.getPermissions()
                        .stream()
                        .collect(Collectors.groupingBy(Permission::getModule));
                Map<String, List<Permission>> groupedPermissions = permissionService.getPermissionsGroupedByModule();

                request.setAttribute("currentPermissions", currentPermissions);
                request.setAttribute("groupedPermissions", groupedPermissions);
                request.setAttribute("role", role);

                request.setAttribute("contentPage", "/views/admin/role/index.jsp");
                request.setAttribute("contentPage", "/views/admin/role/index.jsp");
                request.setAttribute("view", "/views/admin/role/edit-role.jsp");
                request.setAttribute("breadcrumbTitle", breadcrumbTitle);
                request.setAttribute("cardTitle", pageDesc);
                request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));
                request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
            }


        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "error=" + message);
        }

    }

    private static class DataTableResponse {
        private final int draw;
        private final int recordsTotal;
        private final int recordsFiltered;
        private final List<Map<String, String>> data;

        public DataTableResponse(int draw, int recordsTotal, int recordsFiltered, List<Map<String, String>> data) {
            this.draw = draw;
            this.recordsTotal = recordsTotal;
            this.recordsFiltered = recordsFiltered;
            this.data = data;
        }
    }
}
