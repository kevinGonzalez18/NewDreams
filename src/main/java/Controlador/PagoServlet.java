/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import DAO.eventoDAO;
import DAO.pagoDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kevin
 */
public class PagoServlet extends HttpServlet {

    private pagoDAO pagoDAO = new pagoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String action = request.getParameter("action");
        
        if (menu != null && menu.equals("listaPagos")) {
            String idCliente = request.getParameter("idCliente");
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            List<Object[]> listarPagos = pagoDAO.ListarPagos(idCliente, idEvento);
            request.setAttribute("Pagos", listarPagos);

            request.getRequestDispatcher("pagos.jsp").forward(request, response);
        }
        if ("insertarPago".equals(action)) {
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
                System.out.println("Pago registrado con éxito");
                response.sendRedirect("PagoServlet?menu=listaPagos&idCliente=" + idCliente + "&idEvento=" + idEvento);
            } else {
                System.out.println("Error al registrar el pago");
                request.setAttribute("error", "Error al registrar el pago.");
                request.getRequestDispatcher("pagos.jsp").forward(request, response);
            }
        }

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
