package Controlador;

import DAO.eventoDAO;
import DAO.eventoServicioDAO;
import DAO.servicioDAO;
import Modelo.evento;
import Modelo.eventoServicio;
import Modelo.servicio;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EventoServlet extends HttpServlet {

    private eventoDAO eventoDAO = new eventoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String menu = request.getParameter("menu");
        String action = request.getParameter("action");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            if (menu != null && menu.equals("detalleEvento")) {
                if (action != null) {
                    switch (action) {
                        case "eliminarServicio":
                            eliminarServicio(request, response, jsonResponse, out);
                            break;
                        case "actualizarEvento":
                            actualizarEvento(request, response, jsonResponse, out);
                            break;
                        default:
                            mostrarDetallesEvento(request, response);
                            break;
                    }
                } else {
                    mostrarDetallesEvento(request, response);
                }
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Menú o acción no reconocidos");
                out.write(jsonResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Error interno del servidor");
            out.write(jsonResponse.toString());
        } finally {
            out.flush();
            out.close();
        }
    }

    private void actualizarEvento(HttpServletRequest request, HttpServletResponse response, JSONObject jsonResponse, PrintWriter out)
            throws ServletException, IOException {
        try {
            String estado = request.getParameter("estadoEvento");
            String descripcion = request.getParameter("descripcion-evento");
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            int valorEvento = Integer.parseInt(request.getParameter("valor-evento"));
            boolean exitoEvento = false;

            if (estado != null && !estado.isEmpty() && descripcion != null && !descripcion.isEmpty()) {
                evento evento = new evento();
                evento.setEstadoEvento(estado);
                evento.setDescripcionEvento(descripcion);
                evento.setEventoId(idEvento);
                evento.setValorEvento(valorEvento);
                eventoDAO.actualizarEvento(evento);
                exitoEvento = true;
            }

            int index = Integer.parseInt(request.getParameter("total_iterations"));
            System.out.println("index = " + index);
            boolean exitoServicios = false;

            for (int i = 0; i < index; i++) {
                String cantidad = request.getParameter("service_quantity_" + i);
                int cantidadInt = Integer.parseInt(cantidad);
                if (cantidadInt > 0) {
                    String nombreServicio = request.getParameter("service_name_" + i);
                    String precioServicio = request.getParameter("service_price_" + i);
                    String precioTotalServicio = request.getParameter("service_total_" + i);
                    servicio servicio = new servicio();
                    eventoServicio eventoServicio = new eventoServicio();
                    servicioDAO servicioDAO = new servicioDAO();
                    eventoServicioDAO eventoServicioDAO = new eventoServicioDAO();
                    String IdServicio = servicioDAO.consultarIdServicio(nombreServicio);
                    servicio.setServicioId(IdServicio);
                    servicio.setServicioNombre(nombreServicio);
                    System.out.println("cantidad = " + cantidadInt);
                    eventoServicio.setCantidad(cantidadInt);
                    System.out.println("IdServicio = " + IdServicio);
                    int precioTotal = Integer.parseInt(precioTotalServicio);
                    eventoServicio.setPrecioTotal(precioTotal);
                    exitoServicios = eventoServicioDAO.actualizarServiciosEvento(idEvento, IdServicio, cantidadInt, precioTotal);
                }
            }

            if (exitoEvento && exitoServicios) {
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Evento actualizado exitosamente");
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Error al actualizar evento");
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

    private void mostrarDetallesEvento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEvento = Integer.parseInt(request.getParameter("idEvento"));
        List<Object[]> detallesEvento = eventoDAO.DetallesEvento(idEvento);
        request.setAttribute("detalles", detallesEvento);
        request.getRequestDispatcher("detalleEvento.jsp").forward(request, response);
    }

    private void eliminarServicio(HttpServletRequest request, HttpServletResponse response, JSONObject jsonResponse, PrintWriter out)
            throws ServletException, IOException {
        try {
            String serviceIndexStr = request.getParameter("serviceIndex");
            System.out.println("serviceIndexStr = " + serviceIndexStr);
            String nombreServicio = request.getParameter("serviceName");
            System.out.println("nombreServicio = " + nombreServicio);
            String idEventoStr = request.getParameter("idEvento");
            System.out.println("idEventoStr = " + idEventoStr);

            if (serviceIndexStr != null && nombreServicio != null && idEventoStr != null) {
                int serviceIndex = Integer.parseInt(serviceIndexStr);
                System.out.println("serviceIndex = " + serviceIndex);
                int idEvento = Integer.parseInt(idEventoStr);

                servicioDAO servicioDAO = new servicioDAO();
                String idServicio = servicioDAO.consultarIdServicio(nombreServicio);

                if (idServicio != null) {
                    eventoServicioDAO eventoServicioDAO = new eventoServicioDAO();
                    boolean exito = eventoServicioDAO.eliminarServicioEvento(idServicio, idEvento);
                    if (exito) {
                        jsonResponse.put("status", "success");
                        jsonResponse.put("message", "Servicio del evento eliminado exitosamente");
                    } else {
                        jsonResponse.put("status", "error");
                        jsonResponse.put("message", "Error al eliminar el servicio del evento");
                    }
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Servicio no encontrado");
                }
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Parámetros faltantes o inválidos");
            }
        } catch (NumberFormatException e) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Formato de número inválido para idEvento o serviceIndex");
            e.printStackTrace(); // Consider logging this instead of printing the stack trace
        } catch (SQLException e) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Error en la base de datos");
            e.printStackTrace(); // Consider logging this instead of printing the stack trace
        } catch (Exception e) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Error interno del servidor");
            e.printStackTrace(); // Consider logging this instead of printing the stack trace
        } finally {
            out.write(jsonResponse.toString());
            out.flush();
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EventoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
