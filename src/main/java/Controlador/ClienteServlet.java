/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.clienteDAO;
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
public class ClienteServlet extends HttpServlet {

    clienteDAO clienteDAO = new clienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String menu = request.getParameter("menu");
        String accion2 = request.getParameter("accion2");
        if (menu != null && menu.equals("updateClientes")) {
            String clientEmail = request.getParameter("clientEmail");
            List<Object[]> datosCliente = clienteDAO.listarClienteId(clientEmail);
            request.setAttribute("datos", datosCliente);
            request.getRequestDispatcher("updateClientes.jsp").include(request, response);
        } else if (accion2 != null && accion2.equals("update")) {
            System.out.println("Entro al bucle");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("email");
            String phone = request.getParameter("phone");
            String estadoCliente = request.getParameter("estadoCliente");
            System.out.println("Obtuvo los parametros");
            if (nombre != null && apellido != null && correo != null && phone != null && estadoCliente != null) {
                clienteDAO.update(correo, nombre, apellido, phone);
                clienteDAO.updateCliente(correo, estadoCliente);
                System.out.println("Actualizacion exitosa");
                request.getRequestDispatcher("PrincipalServlet?menu=Clientes&&accion=listar").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "There was an error in the form submission. Please check that all fields are filled out.");
                request.getRequestDispatcher("ClienteServlet?menu=updateClientes").include(request, response);
            }
        } else {
            // Handle the case where menu is null or has an unexpected value
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
            Logger.getLogger(ClienteServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClienteServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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

}
