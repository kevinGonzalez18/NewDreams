package Controlador;

import DAO.cotizacionDAO;
import DAO.servicioDAO;
import Modelo.servicio;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author feli1
 */
public class CotizacionServlet extends HttpServlet {

    cotizacionDAO cotizacionDAO = new cotizacionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String menu = request.getParameter("menu");
        String action = request.getParameter("action");
        if (menu != null && !menu.isEmpty() && menu.equals("detalleCotizacion")) {
            String idCotizacion = request.getParameter("idCotizacion");
            List<Object[]> detalleCotizacion = cotizacionDAO.consultarCotizacionPorID(idCotizacion);
            request.setAttribute("cotizacion", detalleCotizacion);
            request.getRequestDispatcher("detalleCotizacion.jsp").forward(request, response);
        }
        if ("addServices".equals(action)) {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            AddServicesRequest addServicesRequest = gson.fromJson(reader, AddServicesRequest.class);

            // Lógica para agregar los servicios a la cotización
            cotizacionDAO.addServicesToCotizacion(addServicesRequest.getEventId(), addServicesRequest.getServices());

            response.setStatus(HttpServletResponse.SC_OK);
        }
        if ("listar".equals(action)) {
            servicioDAO servDAO = new servicioDAO();
            List<servicio> servicios = servDAO.consultarTodosServicios();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(servicios));
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CotizacionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CotizacionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static class AddServicesRequest {

        private String eventId;
        private List<String> services;

        public String getEventId() {
            return eventId;
        }

        public List<String> getServices() {
            return services;
        }
    }

}
