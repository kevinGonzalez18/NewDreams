/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.clienteDAO;
import Modelo.cliente;
import Modelo.cotizante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author feli1
 */
public class PerfilClienteServlet extends HttpServlet {

    cliente cliente = new cliente();
    clienteDAO clienteDAO = new clienteDAO();
    cotizante cotizante = new cotizante();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        String actualizarCliente = request.getParameter("actualizarCliente");
        if (menu != null) {
            if (menu.equals("dashboard")) {
                request.getRequestDispatcher("dashboardCliente.jsp").forward(request, response);
            }
            if (menu.equals("historialEventos")) {
                request.getRequestDispatcher("historialEventosCliente.jsp").forward(request, response);
            }
            if (menu.equals("historialPagos")) {
                request.getRequestDispatcher("historialPagosCliente.jsp").forward(request, response);
            }
            if (menu.equals("misDatos")) {
                String correo = request.getParameter("correo");
                switch (accion) {
                    case "datos":
                        List<Object[]> datos = clienteDAO.listarClienteId(correo);
                        request.setAttribute("datos", datos);
                        break;
                }
                request.getRequestDispatcher("datosCliente.jsp").forward(request, response);
            }
        }

        if (actualizarCliente != null && actualizarCliente.equals("actualizarCliente")) {
            String nombre = request.getParameter("name");
            String apellido = request.getParameter("last-name");
            String correo = request.getParameter("email");
            String telefono = request.getParameter("phone");
            cotizante.setCotizanteNombre(nombre);
            cotizante.setCotizanteApellido(apellido);
            cotizante.setCotizanteCorreo(correo);
            cotizante.setCotizanteTelefono(telefono);
            if (nombre != null && !nombre.isEmpty()
                    && apellido != null && !apellido.isEmpty()
                    && telefono != null && !telefono.isEmpty()
                    && correo != null && !correo.isEmpty()) {
                try {
                    clienteDAO.update(correo, nombre, apellido, telefono);
                    // Si no se lanzó ninguna excepción, la actualización fue exitosa
                    request.setAttribute("actualizacionExitosa", true);
                    
                } catch (SQLException e) {
                    // Si se captura una excepción, la actualización falló
                    request.setAttribute("actualizacionExitosa", false);
                }
            }
            request.getRequestDispatcher("PerfilClienteServlet?menu=dashboard").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
