package Controlador;

import DAO.eventoDAO;
import DAO.pagoDAO;
import java.io.IOException;
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
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            List<Object[]> detallesEvento = eventoDAO.DetallesEvento(idEvento);
            request.setAttribute("detalles", detallesEvento );
            
            request.getRequestDispatcher("detalleEvento.jsp").forward(request, response);
            
        }/*if ("EliminarServicio".equals(action)) {
            String idServicio = request.getParameter("idServicio");
            pagoDAO pagoDAODeleted = new pagoDAO();
            boolean exito = pagoDAODeleted.EliminarServicio(idServicio);
            if (exito) {
                request.setAttribute("mensajeExito", "Servicio eliminado exitosamente");
            } else {
                request.setAttribute("mensajeError", "Error al eliminar el servicio");
            }
        }*/
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
