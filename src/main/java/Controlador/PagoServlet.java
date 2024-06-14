/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import DAO.eventoDAO;
import DAO.pagoDAO;
import DAO.servicioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author kevin
 */
public class PagoServlet extends HttpServlet {

    private pagoDAO pagoDAO = new pagoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String menu = request.getParameter("menu");
        String action = request.getParameter("action");

        response.setContentType("application/json");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        if (menu != null && menu.equals("listaPagos")) {
            String idCliente = request.getParameter("idCliente");
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            List<Object[]> listarPagos = pagoDAO.ListarPagos(idCliente, idEvento);
            request.setAttribute("Pagos", listarPagos);
            request.getRequestDispatcher("pagos.jsp").forward(request, response);
        }
        if ("insertarPago".equals(action)) {
            try {
                System.out.println("Inserting pago");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String fechaStr = request.getParameter("fecha");
                int valor = Integer.parseInt(request.getParameter("valor"));
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                String idCliente = request.getParameter("idCliente");

                java.sql.Date fecha = null;
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    fecha = new java.sql.Date(sdf.parse(fechaStr).getTime());
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                boolean exito = pagoDAO.RegistrarPago(nombre, apellido, fecha, valor, idEvento, idCliente);
                if (exito) {
                    jsonResponse.put("status", "success");
                    jsonResponse.put("message", "Pago agregado exitosamente");
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Error al agregar pago");
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PagoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PagoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
