package servlets;

import config.MenuConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repositoriesImpl.BookRepositoryImpl;
import repositoriesImpl.CategoryRepositoryImpl;
import services.IBookServiceImpl;
import services.ICategoryServiceImpl;
import servicesImpl.IBookService;

import java.io.IOException;

@WebServlet({"/admin/category"})

public class CategoryServlet extends HttpServlet {
    private ICategoryServiceImpl categoryService;
    private IBookService bookService;
    private MenuConfig menuConfig;

    public void init() throws ServletException {
        this.categoryService = new ICategoryServiceImpl(new CategoryRepositoryImpl());
        this.bookService = new IBookServiceImpl(new BookRepositoryImpl());

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("contentPage", "/views/admin/category/index.jsp");
        request.setAttribute("view", "/views/admin/category/view-list.jsp");
        request.getRequestDispatcher("/views/layouts/admin.jsp").forward(request, response);

    }

    protected void insertUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
//        String email = req.getParameter("email");
//        String country = request.getParameter("country");
//        User newUser = new User(name, email, country);
//        userDAO.insertUser(newUser);
//        this.categoryService.add(new Category(name));
        resp.sendRedirect("list");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        String username = req.getParameter("uname");
//        String password = req.getParameter("psw");
//        String SQL_GET_USER = "SELECT * FROM users WHERE name = ? AND password = ?";
//        try (Connection connection = DBConnectionPool.getConnection();
//
//             // Step 2:Create a statement using connection object
//             PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_USER);) {
//            preparedStatement.setString(1, username);
//            preparedStatement.setString(2, password);
//
//            System.out.println(preparedStatement);
//            // Step 3: Execute the query or update query
//            ResultSet rs = preparedStatement.executeQuery();
//            if(rs.next()){
//                HttpSession session = req.getSession();
//                System.out.println(rs.getString("role"));
//                session.setAttribute("userRole", rs.getString("role"));
//                session.setAttribute("user", rs.getString("name"));
//            }
//            resp.sendRedirect(req.getContextPath() + "/admin");
//
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }

    }
}
