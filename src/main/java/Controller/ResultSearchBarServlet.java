package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.GiocoDAO;
import java.io.IOException;
import java.util.List;

@WebServlet("/resultSearchBar")
public class ResultSearchBarServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("testo");
        GiocoDAO giocoDAO = new GiocoDAO();

        response.setContentType("text/plain");
        if (text == null || text.isEmpty()) {
            response.getWriter().print("NO_TEXT");
        } else {
            response.getWriter().print("SEARCHING_FOR:" + text);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}