package Controlador;

import DAO.eventoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventoServlet extends HttpServlet {

    private eventoDAO eventoDAO = new eventoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String action = request.getParameter("action");

        if (menu != null && menu.equals("detalleEvento")) {
            if (action != null && action.equals("eliminarServicio")) {
                eliminarServicio(request, response);
            } else {
                mostrarDetallesEvento(request, response);
            }
        }
    }

    private void mostrarDetallesEvento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEvento = Integer.parseInt(request.getParameter("idEvento"));
        List<Object[]> detallesEvento = eventoDAO.DetallesEvento(idEvento);
        request.setAttribute("detalles", detallesEvento);
        request.getRequestDispatcher("detalleEvento.jsp").forward(request, response);
    }

    private void eliminarServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEvento = Integer.parseInt(request.getParameter("idEvento"));
        String idServicio = request.getParameter("idServicio");
        try {
            eventoDAO.EliminarServicioEvento(idEvento, idServicio);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al eliminar el servicio: " + e.getMessage());
        }

        mostrarDetallesEvento(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
