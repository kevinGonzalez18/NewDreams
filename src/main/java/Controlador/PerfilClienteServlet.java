/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.clienteDAO;
import DAO.pagoDAO;
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
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author feli1
 */
public class PerfilClienteServlet extends HttpServlet {

    cliente cliente = new cliente();
    clienteDAO clienteDAO = new clienteDAO();
    cotizante cotizante = new cotizante();
    pagoDAO pagoDAO = new pagoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idCliente = (String) session.getAttribute("clienteId");
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        String actualizarCliente = request.getParameter("actualizarCliente");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        if (menu != null) {
            if (menu.equals("dashboard")) {
                request.getRequestDispatcher("dashboardCliente.jsp").forward(request, response);
            }
            if (menu.equals("historialEventos")) {
                List<Object[]> detallesEvento = clienteDAO.listarEventosCliente(idCliente);
                request.setAttribute("detalles", detallesEvento);
                request.getRequestDispatcher("historialEventosCliente.jsp").forward(request, response);
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
        if ("detalleEvento".equals(accion)) {
            List<Object[]> detallesEvento = clienteDAO.listarEventosCliente(idCliente);
            request.setAttribute("detalles", detallesEvento);
            request.getRequestDispatcher("detalleEventoCliente.jsp").forward(request, response);
        }
        if ("detallePagos".equals(accion)) {
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            List<Object[]> listarPagos = pagoDAO.ListarPagos(idCliente, idEvento);
            request.setAttribute("Pagos", listarPagos);
            request.getRequestDispatcher("historialPagosCliente.jsp").forward(request, response);
        }

        if (actualizarCliente != null && actualizarCliente.equals("actualizarCliente")) {
            boolean exito = false;
            try {
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
                        exito = true;

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    if (exito) {
                        jsonResponse.put("status", "success");
                        jsonResponse.put("message", "Datos actualizados exitosamente");
                    } else {
                        jsonResponse.put("status", "error");
                        jsonResponse.put("message", "Error al actualizar los datos");
                    }
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Todos los campos deben estar llenos");
                }
            } catch (Exception e) {
                e.printStackTrace();
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Error interno del servidor");
            } finally {
                out.print(jsonResponse.toString());
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
