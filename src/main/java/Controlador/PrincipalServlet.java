package Controlador;

import DAO.clienteDAO;
import DAO.cotizacionDAO;
import DAO.cotizanteDAO;
import DAO.eventoDAO;
import Modelo.cliente;
import Modelo.cotizante;
import Modelo.evento;
import java.io.IOException;
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
 * @author Felipe Rodriguez
 */
public class PrincipalServlet extends HttpServlet {

    cotizante cotizante = new cotizante();
    cotizanteDAO cotizanteDAO = new cotizanteDAO();
    cliente cliente = new cliente();
    clienteDAO clienteDAO = new clienteDAO();
    cotizacionDAO cotizacionDAO = new cotizacionDAO();
    eventoDAO eventoDAO = new eventoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setCharacterEncoding("UTF-8");
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu != null) {
            if (menu.equals("Inicio")) {
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
            if (menu.equals("Cotizaciones")) {
                switch (accion) {
                    case "listar":
                        List<Object[]> listaCotizaciones = cotizacionDAO.listarCotizaciones();
                        request.setAttribute("cotizaciones", listaCotizaciones);
                        break;
                }
                request.getRequestDispatcher("cotizaciones.jsp").forward(request, response);
            }
            if (menu.equals("Cotizantes")) {
                switch (accion) {
                    case "listar":
                        List lista = cotizanteDAO.listar();
                        request.setAttribute("cotizantes", lista);
                        break;
                    case "Agregar":
                        String correo = request.getParameter("correoClt");
                        System.out.println("correo = " + correo);
                        String contraseña = request.getParameter("contrasenaClt");
                        System.out.println("contraseña = " + contraseña);
                        cliente.setCltCorreo(correo);
                        cliente.setCltContraseña(contraseña);
                        System.out.println(cliente.toString());

                        // Aquí debes verificar si el correo y la contraseña son válidos antes de agregar el cliente
                        if (correo != null && !correo.isEmpty() && contraseña != null && !contraseña.isEmpty()) {
                            clienteDAO.agregar(cliente);
                            clienteDAO.covertirCotizanteEnCliente();
                            // Redireccionar después de agregar exitosamente
                            request.getRequestDispatcher("PrincipalServlet?menu=Cotizantes&accion=listar").forward(request, response);
                        }
                        break;
                    case "Editar":
                        break;
                    case "Eliminar":
                        break;
                }
                request.getRequestDispatcher("cotizantes.jsp").forward(request, response);
            }
            if (menu.equals("Clientes")) {
                switch (accion) {
                    case "listar":
                        List<Object[]> listaClientes = clienteDAO.listarClientes();
                        request.setAttribute("clientes", listaClientes);
                        break;
                }
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
            }
            if (menu.equals("Eventos")) {
                switch (accion){
                    case "listar":
                        List<Object[]> listaEventos = eventoDAO.listarEventos();
                        request.setAttribute("evento", listaEventos);
                }
                request.getRequestDispatcher("eventos.jsp").forward(request, response);
            }
            if (menu.equals("Estados")) {
                request.getRequestDispatcher("estados.jsp").forward(request, response);
            }
            if (menu.equals("Servicios")) {
                request.getRequestDispatcher("servicios.jsp").forward(request, response);
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
            Logger.getLogger(PrincipalServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PrincipalServlet.class.getName()).log(Level.SEVERE, null, ex);
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
