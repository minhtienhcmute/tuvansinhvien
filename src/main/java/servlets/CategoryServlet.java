package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Category;
import repositoriesImpl.CategoryRepositoryImpl;
import servicesImpl.CategoryServiceImpl;
import utils.BreadcrumbUtils;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet({"/admin/category"})

public class CategoryServlet extends HttpServlet {
    private CategoryServiceImpl categoryService;
    private final String breadcrumbTitle = "Category management";


    public void init() throws ServletException {
        this.categoryService = new CategoryServiceImpl(new CategoryRepositoryImpl());

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String action = request.getParameter("action");
            if (action == null) action = "view";

            switch (action) {
                case "view":
                    // show list
                    String cateId = request.getParameter("id");

                    if (cateId != null) {
                        handleViewDetail(request, response);
                    } else {
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
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    protected void handleViewPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Category> categories = this.categoryService.getAll();
            request.setAttribute("categories", categories);
            request.setAttribute("contentPage", "/views/admin/category/index.jsp");
            request.setAttribute("view", "/views/admin/category/view-list.jsp");
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", "Questions");

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            String msg = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category" + "?error=" + msg);
        }
    }

    protected void handleEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pageDesc = "Edit category";
            String[][] breadcrumbs = {
                    {"Categories", "/admin/category"},
                    {pageDesc, null},
            };
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", pageDesc);
            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));


            int cateId = Integer.parseInt(request.getParameter("id"));

            Category category = categoryService.getById(cateId);
            request.setAttribute("category", category);
            request.setAttribute("contentPage", "/views/admin/category/index.jsp");
            request.setAttribute("view", "/views/admin/category/edit-category.jsp");

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category" + "?error=" + message);

        }
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: code thêm role
        try {
            String[][] breadcrumbs = {
                    {"Categories", "/admin/category"},
                    {"Add category", null},
            };


            request.setAttribute("contentPage", "/views/admin/category/index.jsp");
            request.setAttribute("view", "/views/admin/category/add-category.jsp");
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", "Add category");

            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin" + "?error=" + message);
        }


    }

    protected void handleViewDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pageDesc = "View category";
            String[][] breadcrumbs = {
                    {"Questions", "/admin/category"},
                    {pageDesc, null},
            };
            request.setAttribute("breadcrumbTitle", breadcrumbTitle);
            request.setAttribute("cardTitle", pageDesc);
            request.setAttribute("breadcrumbItems", BreadcrumbUtils.createBreadcrumb(breadcrumbs));


            int cateId = Integer.parseInt(request.getParameter("id"));

            Category category = categoryService.getById(cateId);
//
            request.setAttribute("category", category);
            request.setAttribute("contentPage", "/views/admin/category/index.jsp");
            request.setAttribute("view", "/views/admin/category/view-detail.jsp");

            request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);
        } catch (Exception e) {
            String message = URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category" + "?error=" + message);

        }
    }

    protected void doAddPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");


        // Kiểm tra dữ liệu hợp lệ
        if (name == null || name.trim().isEmpty()) {
            throw new Exception("Tên danh mục không được để trống");
        }

        try {

            this.categoryService.add(new Category(name, desc));
            String msg = "Thêm category thành công!";
            String encodedErrorMessage = URLEncoder.encode(msg, StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category?action=add&success=" + encodedErrorMessage);

        } catch (Exception e) {
            e.printStackTrace();

            // Xử lý lỗi khi thêm role hoặc phân quyền
            String errorMessage = "Lỗi: " + e.getMessage();
            String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category?action=add&error=" + encodedErrorMessage);
        }
    }

    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            if (id == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/category?error=" + URLEncoder.encode("ID không hợp lệ", StandardCharsets.UTF_8));
                return;
            }
            Category cate = new Category();
            cate.setId(Integer.parseInt(id));
            categoryService.delete(cate);
            resp.sendRedirect(req.getContextPath() + "/admin/category?success=" + URLEncoder.encode("Xóa danh mục thành công", StandardCharsets.UTF_8));
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/category?error=" + URLEncoder.encode("Lỗi: " + e.getMessage(), StandardCharsets.UTF_8));
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cateId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        try {


            if (name == null || name.trim().isEmpty()) {
                throw new Exception("Tên danh mục không được để trống");
            }

            Category category = new Category();
            category.setId(cateId);
            category.setName(name);
            category.setDescription(desc);

            categoryService.update(category);

            String msg = "Cập nhật danh mục thành công!";
            String encoded = URLEncoder.encode(msg, StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category?action=edit&id=" + cateId + "&success=" + encoded);
        } catch (Exception e) {
            e.printStackTrace();
            String err = URLEncoder.encode("Lỗi khi cập nhật: " + e.getMessage(), StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/admin/category?action=edit&id=" + cateId + "&error=" + err);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        try {
            switch (action) {
                case "add":
                    doAddPost(req, resp);
                    break;
                case "edit":
                    doPut(req, resp);
                    break;
                case "delete":
                    doDelete(req, resp);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
