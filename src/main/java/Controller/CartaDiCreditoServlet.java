package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Utente;
import java.io.IOException;



@WebServlet("/CartaDiCreditoServlet")
public class CartaDiCreditoServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numeroCartaDiCredito = request.getParameter("numeroCarta");
        String indirizzo = request.getParameter("indirizzo");
        Integer cap;

        try {
            cap = Integer.parseInt(request.getParameter("cap"));
        } catch (NumberFormatException numberFormatException) {
            cap = null;
        }

        String citta = request.getParameter("citta");
        String circuito = request.getParameter("circuito");
        String dataScadenza = request.getParameter("dataScadenza");

        Utente utente = (Utente) request.getSession().getAttribute("utente");

        // Validazione super basilare per il primo commit
        if (numeroCartaDiCredito == null || numeroCartaDiCredito.isEmpty() || utente == null) {
            request.setAttribute("ErroreCarta", "Dati essenziali carta mancanti.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("LoadPageUserServlet"); // O una pagina di errore generica
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("MessaggioStato", "Parametri carta ricevuti. Validazione e salvataggio da implementare.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("LoadPageUserServlet");
            dispatcher.forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Includi i metodi privati, ma falli ritornare false per simulare un errore iniziale
    private Boolean controlloNumeroCarta(String numeroCarta) { return false; }
    private Boolean controlloCap(Integer cap) { return false; }
    private Boolean controlloIndirizzo(String indirizzo) { return false; }
    private Boolean controlloCitta(String citta) { return false; }
}