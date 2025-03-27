package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Book;
import models.Category;
import repositoriesImpl.BookRepositoryImpl;
import repositoriesImpl.CategoryRepositoryImpl;
import services.IBookServiceImpl;
import services.ICategoryServiceImpl;
import servicesImpl.IBookService;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin"})

public class AdminServlet extends HttpServlet {
    private ICategoryServiceImpl categoryService;
    private IBookService bookService;
    public void init() throws ServletException {
        this.categoryService = new ICategoryServiceImpl(new CategoryRepositoryImpl());
        this.bookService = new IBookServiceImpl(new BookRepositoryImpl());

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> testGetData = this.bookService.getAll();
        System.out.println(testGetData);
        req.getRequestDispatcher("/views/layouts/admin.jsp").forward(req, resp);


//        String act =req.getParameter("act") ;
//            if(act!= null && act.equals("add")){
//                req.getRequestDispatcher("./views/add-form.jsp").forward(req, resp);
//            }
//            if(act.equals("edit")){
//             int id = Integer.parseInt(req.getParameter("id"));
//            Category category = this.categoryService.getById(id);
//            req.setAttribute("category", category);
//            req.getRequestDispatcher("./views/add-form.jsp").forward(req, resp);
//            }

//        String action = req.getServletPath();

//        try {
//            switch (action) {
//                case "/new":
//                    bookService.add(new Book());
//                    req.getRequestDispatcher("./views/add-form.jsp").forward(req, resp);
//                    break;
//                case "/insert":
//                    insertUser(req, resp);
//                    break;
//                case "/delete":
//                    deleteUser(request, response);
//                    break;
//                case "/edit":
//                    showEditForm(request, response);
//                    break;
//                case "/update":
//                    updateUser(request, response);
//                    break;
//                default:
//
//                    break;
//            }
//        } catch (SQLException ex) {
//            throw new ServletException(ex);
//        }


    }
    protected void insertUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
//        String email = req.getParameter("email");
//        String country = request.getParameter("country");
//        User newUser = new User(name, email, country);
//        userDAO.insertUser(newUser);
        this.categoryService.add(new Category(name));
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
