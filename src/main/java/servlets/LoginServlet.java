package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.DBConnectionPool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet({"/login"})

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Category> categories = this.categoryService.getAll();
//        int categoryId = Integer.parseInt(req.getParameter("category_id")) ;

//        List <Book> books = this.bookService.getByCategory(categoryId);

//        req.setAttribute("categories",categories);
//        req.setAttribute("books",books);
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("uname");
        String password = req.getParameter("psw");
        String SQL_GET_USER = "SELECT * FROM users WHERE name = ? AND password = ?";
        try (Connection connection = DBConnectionPool.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_GET_USER)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession();
                System.out.println(rs.getString("role"));
                session.setAttribute("userRole", rs.getString("role"));
                session.setAttribute("user", rs.getString("name"));
            }
            resp.sendRedirect(req.getContextPath() + "/admin");


        } catch (SQLException e) {
            System.out.println(e);
        }

    }
}
