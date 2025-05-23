package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.Utente;
import Model.Carrello; // Aggiungi questa importazione
import java.io.IOException;

@WebServlet("/EffettuaOrdineServlet")
public class EffettuaOrdineServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String numeroCarta = request.getParameter("numeroCarta");
        Utente utente = (Utente) request.getSession().getAttribute("utente");

        if (numeroCarta == null || numeroCarta.isEmpty() || utente == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/error.jsp"); // Pagina di errore o reindirizzamento generico
            dispatcher.forward(request, response);
        } else {
            // Placeholder per logica futura
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/placeholder_ordine.jsp"); // Una pagina temporanea di attesa
            dispatcher.forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
}