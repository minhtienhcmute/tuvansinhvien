package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Category;
import repositoriesImpl.BookRepositoryImpl;
import repositoriesImpl.CategoryRepositoryImpl;
import services.IBookServiceImpl;
import services.ICategoryServiceImpl;
import servicesImpl.IBookService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet({""})
public class HomeServlet extends HttpServlet {
    //    private ICategoryServiceImpl categoryService;
//    private IBookService bookService;
//    public void init() throws ServletException {
//        this.categoryService = new ICategoryServiceImpl(new CategoryRepositoryImpl());
//        this.bookService = new IBookServiceImpl(new BookRepositoryImpl());
//
//    }
    private ICategoryServiceImpl categoryService;
    private IBookService bookService;

    public void init() throws ServletException {
        this.categoryService = new ICategoryServiceImpl(new CategoryRepositoryImpl());
        this.bookService = new IBookServiceImpl(new BookRepositoryImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Category> testGetData = this.categoryService.getAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
//        System.out.println(testGetData);
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);

        //        List<Category> categories = this.categoryService.getAll();
//        int categoryId = Integer.parseInt(req.getParameter("category_id")) ;
//
//        List <Book> books = this.bookService.getByCategory(categoryId);
//
//        req.setAttribute("categories",categories);
//        req.setAttribute("books",books);
//        resp.sendRedirect(req.getContextPath() + "/views/layouts/client.jsp");

//        req.getRequestDispatcher("./views/layouts/client.jsp").forward(req, resp);
    }
}
