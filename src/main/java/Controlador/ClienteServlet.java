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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author feli1
 */
public class ClienteServlet extends HttpServlet {

    clienteDAO clienteDAO = new clienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("application/json");
        request.setCharacterEncoding("UTF-8");
        String menu = request.getParameter("menu");
        String accion2 = request.getParameter("accion2");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        if (menu != null && menu.equals("updateClientes")) {
            String clientEmail = request.getParameter("clientEmail");
            List<Object[]> datosCliente = clienteDAO.listarClienteId(clientEmail);
            request.setAttribute("datos", datosCliente);
            request.getRequestDispatcher("updateClientes.jsp").include(request, response);
        } else if (accion2 != null && accion2.equals("update")) {
            try {
                System.out.println("Entro al bucle");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correo = request.getParameter("email");
                String phone = request.getParameter("phone");
                String estadoCliente = request.getParameter("estadoCliente");
                System.out.println("Obtuvo los parametros");
                if (nombre != null && apellido != null && correo != null && phone != null && estadoCliente != null) {
                    boolean exito = clienteDAO.update(correo, nombre, apellido, phone);
                    boolean exito2 = clienteDAO.updateCliente(correo, estadoCliente);
                    if (exito && exito2) {
                        jsonResponse.put("status", "success");
                        jsonResponse.put("message", "Cliente actualizado exitosamente");
                    } else {
                        jsonResponse.put("status", "error");
                        jsonResponse.put("message", "Error al actualizar el cliente");
                    }
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Error al actualizar el cliente");
                }
            } catch (Exception e) {
                e.printStackTrace();
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Error interno del servidor");
            } finally {
                out.write(jsonResponse.toString());
                out.flush();
                out.close();
            }
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
