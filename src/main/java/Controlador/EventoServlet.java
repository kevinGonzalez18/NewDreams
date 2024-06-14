package Controlador;

import DAO.eventoDAO;
import DAO.eventoServicioDAO;
import DAO.servicioDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventoServlet extends HttpServlet {

    private eventoDAO eventoDAO = new eventoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

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
            throws ServletException, IOException, SQLException {
        String serviceIndexStr = request.getParameter("serviceIndex");
        if (serviceIndexStr != null) {
            int serviceIndex = Integer.parseInt(serviceIndexStr);
            System.out.println("serviceIndex = " + serviceIndex);

            String nombreServicio = request.getParameter("serviceName");
            System.out.println("nombreServicio = " + nombreServicio);

            String idEventoStr = request.getParameter("idEvento");
            if (idEventoStr != null) {
                try {
                    int idEvento = Integer.parseInt(idEventoStr);
                    System.out.println("idEvento = " + idEvento);

                    servicioDAO servicioDAO = new servicioDAO();
                    String idServicio = servicioDAO.consultarIdServicio(nombreServicio);
                    System.out.println("idServicio = " + idServicio);
                    
                    eventoServicioDAO eventoServicioDAO = new eventoServicioDAO();
                    eventoServicioDAO.eliminarServicioEvento(idServicio, idEvento);
                    System.out.println("Servicio eliminado de la bd");
                } catch (NumberFormatException e) {
                    System.out.println("Error: idEvento no es un número válido.");
                }

            }    //response.sendRedirect("PrincipalServlet?menu=Cotizaciones&accion=listar");
        } else {
            System.out.println("Error: el servicio no se encontró en la base de datos.");
            // Manejar el caso cuando idServicio es null
            // Redirigir a una página de error o mostrar un mensaje apropiado
            response.sendRedirect("PrincipalServlet?menu=Cotizaciones&accion=error&mensaje=ServicioNoEncontrado");
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
