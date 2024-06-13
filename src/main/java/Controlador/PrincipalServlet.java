package Controlador;

import DAO.clienteDAO;
import DAO.cotizacionDAO;
import DAO.cotizanteDAO;
import DAO.eventoDAO;
import DAO.servicioDAO;
import Modelo.cliente;
import Modelo.cotizante;
import Modelo.servicio;
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
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Felipe Rodriguez
 */
public class PrincipalServlet extends HttpServlet {

    cotizanteDAO cotizanteDAO = new cotizanteDAO();
    cliente cliente = new cliente();
    clienteDAO clienteDAO = new clienteDAO();
    cotizacionDAO cotizacionDAO = new cotizacionDAO();
    eventoDAO eventoDAO = new eventoDAO();
    servicioDAO servicioDAO = new servicioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        response.setContentType("application/json");
        request.setCharacterEncoding("UTF-8");
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
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
                        try {
                            String correo = request.getParameter("correoClt");
                            System.out.println("correo = " + correo);
                            String contraseña = request.getParameter("contrasenaClt");
                            System.out.println("contraseña = " + contraseña);
                            cliente.setCltCorreo(correo);
                            cliente.setCltContraseña(contraseña);
                            System.out.println(cliente.toString());
                            // Aquí debes verificar si el correo y la contraseña son válidos antes de agregar el cliente
                            if (correo != null && !correo.isEmpty() && contraseña != null && !contraseña.isEmpty()) {
                                boolean exito = clienteDAO.agregar(cliente);
                                clienteDAO.covertirCotizanteEnCliente();
                                if (exito) {
                                    jsonResponse.put("status", "success");
                                    jsonResponse.put("message", "Cliente creado exitosamente");
                                } else {
                                    jsonResponse.put("status", "error");
                                    jsonResponse.put("message", "Error al crear el cliente");
                                }
                            } else {
                                jsonResponse.put("status", "error");
                                jsonResponse.put("message", "Error al crear el cliente");
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
                        break;
                    case "Editar":
                        break;
                    case "eliminar":
                        try {
                            String correo = request.getParameter("correoClt");
                            cotizante cotizanteEliminar = new cotizante();
                            cotizanteEliminar.setCotizanteCorreo(correo);
                            if (correo != null && !correo.isEmpty()) {
                                boolean exito = cotizanteDAO.eliminar(cotizanteEliminar.getCotizanteCorreo());
                                if (exito) {
                                    jsonResponse.put("status", "success");
                                    jsonResponse.put("message", "Cotizante eliminado exitosamente");
                                } else {
                                    jsonResponse.put("status", "error");
                                    jsonResponse.put("message", "Error al eliminar el cotizante");
                                }
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
                        RequestDispatcher dispatcherEliminarCotizantes = request.getRequestDispatcher("resultadoAgregar.jsp");
                        dispatcherEliminarCotizantes.forward(request, response);
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
                switch (accion) {
                    case "listar":
                        List<Object[]> listaEventos = eventoDAO.listarEventos();
                        request.setAttribute("evento", listaEventos);
                }
                request.getRequestDispatcher("eventos.jsp").forward(request, response);
            }
            if (menu.equals("Estados")) {
                switch (accion) {
                    case "listar":
                        List<Object[]> listaCotizacionesNoAprobadas = cotizacionDAO.listarCotizacionesNoAprobadas();
                        request.setAttribute("noAprobadas", listaCotizacionesNoAprobadas);
                        List<Object[]> listaEventosRealizados = eventoDAO.listarEventosRealizados();
                        request.setAttribute("eventoRealizados", listaEventosRealizados);
                        break;
                }
                request.getRequestDispatcher("estados.jsp").forward(request, response);
            }
            if (menu.equals("Servicios")) {
                switch (accion) {
                    case "listar":
                        List<servicio> listaServicios = servicioDAO.consultarTodosServicios();
                        request.setAttribute("listaServicios", listaServicios);
                        break;
                    case "agregar":
                        try {
                            String nombre = request.getParameter("nombreServicio");
                            int valor = Integer.parseInt(request.getParameter("valorServicio"));
                            String tipo = request.getParameter("tipoServicio");
                            if (nombre != null && !nombre.isEmpty()
                                    && tipo != null && !tipo.isEmpty()
                                    && valor > 0) {
                                servicio nuevoServicio = new servicio();
                                nuevoServicio.setServicioNombre(nombre);
                                nuevoServicio.setServicioValor(valor);
                                nuevoServicio.setServicioTipo(tipo);
                                servicioDAO servicioDAO = new servicioDAO();
                                boolean exito = servicioDAO.agregar(nuevoServicio);

                                if (exito) {
                                    jsonResponse.put("status", "success");
                                    jsonResponse.put("message", "Servicio agregado exitosamente");
                                } else {
                                    jsonResponse.put("status", "error");
                                    jsonResponse.put("message", "Error al agregar el servicio");
                                }
                            } else {
                                jsonResponse.put("status", "error");
                                jsonResponse.put("message", "Error al agregar el servicio");
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
                        break;
                    case "actualizar":
                        try {
                            String idServicioActualizar = request.getParameter("idServicioActualizar");
                            String nombreServicio = request.getParameter("nombreServicioActualizar");
                            int valorServicio = Integer.parseInt(request.getParameter("valorServicioActualizar"));
                            String tipoServicio = request.getParameter("tipoServicioActualizar");
                            if (idServicioActualizar != null && !idServicioActualizar.isEmpty()
                                    && nombreServicio != null && !nombreServicio.isEmpty()
                                    && tipoServicio != null && !tipoServicio.isEmpty()
                                    && valorServicio > 0) {
                                servicio actualizarServicio = new servicio(idServicioActualizar, valorServicio, nombreServicio, tipoServicio);
                                boolean exito = servicioDAO.actualizar(actualizarServicio);

                                if (exito) {
                                    jsonResponse.put("status", "success");
                                    jsonResponse.put("message", "Servicio actualizado exitosamente");
                                } else {
                                    jsonResponse.put("status", "error");
                                    jsonResponse.put("message", "Error al actualizar el servicio");
                                }
                            } else {
                                jsonResponse.put("status", "error");
                                jsonResponse.put("message", "Error al actualizar el servicio");
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
                        break;
                    case "eliminar":
                        try {
                            String idServicio = request.getParameter("idServicio");
                            if (idServicio != null && !idServicio.isEmpty()) {
                                servicioDAO servicioDAOforDeleted = new servicioDAO();
                                boolean exito = servicioDAOforDeleted.eliminar(idServicio);
                                if (exito) {
                                    jsonResponse.put("status", "success");
                                    jsonResponse.put("message", "Servicio eliminado exitosamente");
                                } else {
                                    jsonResponse.put("status", "error");
                                    jsonResponse.put("message", "Error al actualizar el servicio");
                                }
                            } else {
                                jsonResponse.put("status", "error");
                                jsonResponse.put("message", "Error al eliminar el servicio");
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
                        break;
                }
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
            Logger.getLogger(PrincipalServlet.class
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
            Logger.getLogger(PrincipalServlet.class
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
