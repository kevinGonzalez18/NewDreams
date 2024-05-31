package Controlador;

import DAO.cotizacionDAO;
import DAO.cotizacionServicioDAO;
import DAO.cotizanteDAO;
import DAO.servicioDAO;
import Modelo.cotizacion;
import Modelo.cotizacionServicio;
import Modelo.cotizante;
import Modelo.servicio;
import com.google.gson.Gson;
import java.io.BufferedReader;
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

/**
 *
 * @author feli1
 */
public class CotizacionServlet extends HttpServlet {

    cotizacionDAO cotizacionDAO = new cotizacionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String menu = request.getParameter("menu");
        String action = request.getParameter("action");
        if (menu != null && !menu.isEmpty() && menu.equals("detalleCotizacion")) {
            String idCotizacion = request.getParameter("idCotizacion");
            List<Object[]> detalleCotizacion = cotizacionDAO.consultarCotizacionPorID(idCotizacion);
            request.setAttribute("cotizacion", detalleCotizacion);
            request.getRequestDispatcher("detalleCotizacion.jsp").forward(request, response);
        }
        
        if (menu != null && !menu.isEmpty() && menu.equals("deletedCotizacion")){
            String idCotizacion = request.getParameter("idCotizacion");
            cotizacion cotizacion = new cotizacion();
            cotizacion.setCodigoCotizacion(idCotizacion);
            cotizacionDAO.deletedCotizacion(cotizacion.getCodigoCotizacion());
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

        if ("deleteService".equals(action)) {
            String serviceIndexStr = request.getParameter("serviceIndex");
            if (serviceIndexStr != null) {
                int serviceIndex = Integer.parseInt(serviceIndexStr);
                System.out.println("serviceIndex = " + serviceIndex);
                String nombreServicio = request.getParameter("serviceName");
                System.out.println("nombreServicio = " + nombreServicio);
                String idCotizacion = request.getParameter("idCotizacion");
                servicioDAO servicioDAO = new servicioDAO();
                String idServicio = servicioDAO.consultarIdServicio(nombreServicio);
                System.out.println("idServicio = " + idServicio);

                if (idServicio != null) {
                    cotizacionServicioDAO cotizacionServicioDAO = new cotizacionServicioDAO();
                    cotizacionServicioDAO.eliminarServicioCotizacion(idServicio, idCotizacion);
                    System.out.println("Servicio eliminado de la bd");

                    // Redireccionar o responder según sea necesario
                    //response.sendRedirect("PrincipalServlet?menu=Cotizaciones&accion=listar");
                } else {
                    System.out.println("Error: el servicio no se encontró en la base de datos.");
                    // Manejar el caso cuando idServicio es null
                    // Redirigir a una página de error o mostrar un mensaje apropiado
                    response.sendRedirect("PrincipalServlet?menu=Cotizaciones&accion=error&mensaje=ServicioNoEncontrado");
                }
            } else {
                System.out.println("Error al eliminar el servicio de la bd");
                // Manejar el caso cuando serviceIndexStr es null
                // Redirigir a una página de error o mostrar un mensaje apropiado
                //response.sendRedirect("PrincipalServlet?menu=Cotizaciones&accion=error&mensaje=ParametrosInvalidos");
            }
        }

        if ("updateCotizacion".equals(action)) {
            String correo = request.getParameter("correoCotizacion");
            System.out.println("correo = " + correo);
            String nombre = request.getParameter("nombreCotizacion");
            System.out.println("nombre = " + nombre);
            String apellido = request.getParameter("apellidoCotizacion");
            System.out.println("apellido = " + apellido);
            String telefono = request.getParameter("telefonoCotizacion");
            System.out.println("telefono = " + telefono);
            cotizante cotizante = new cotizante(correo, nombre, apellido, telefono);
            if (correo != null && !correo.isEmpty()
                    && nombre != null && !nombre.isEmpty()
                    && apellido != null && !apellido.isEmpty()
                    && telefono != null && !telefono.isEmpty()) {
                cotizanteDAO cotizanteDAO = new cotizanteDAO();
                boolean exitoInsercion = cotizanteDAO.actualizar(cotizante);
                if (exitoInsercion) {
                    // La inserción fue exitosa
                    System.out.println("Actualizacion de cotizante exitosa");
                } else {
                    // Por ejemplo:
                    System.out.println("Actualizacion de cotizante erronea");
                    response.getWriter().println("Error al insertar en la base de datos");
                }
            }

            String idCotizacion = request.getParameter("idCotizacion");
            System.out.println("idCotizacion = " + idCotizacion);
            String tipoEvento = request.getParameter("tipoCotizacion");
            System.out.println("tipoEvento = " + tipoEvento);
            String cantidadStr = request.getParameter("cantidadCotizacion");
            System.out.println("cantidadStr = " + cantidadStr);
            String fechaEventoStr = request.getParameter("fechaEvento");
            System.out.println("fechaEventoStr = " + fechaEventoStr);
            String ubicacion = request.getParameter("ubicacionCotizacion");
            System.out.println("ubicacion = " + ubicacion);
            String valorCotizacionStr = request.getParameter("valorCotizacion");
            System.out.println("valorCotizacionStr = " + valorCotizacionStr);

            // Validación de datos no nulos o vacíos
            if (idCotizacion != null && !idCotizacion.isEmpty()
                    && tipoEvento != null && !tipoEvento.isEmpty()
                    && cantidadStr != null && !cantidadStr.isEmpty()
                    && fechaEventoStr != null && !fechaEventoStr.isEmpty()
                    && ubicacion != null && !ubicacion.isEmpty()
                    && valorCotizacionStr != null && !valorCotizacionStr.isEmpty()) {

                try {
                    int cantidad = Integer.parseInt(cantidadStr);
                    int valorCotizacion = Integer.parseInt(valorCotizacionStr);

                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    java.util.Date fechaEventoUtil = dateFormat.parse(fechaEventoStr);
                    java.sql.Timestamp fechaEvento = new java.sql.Timestamp(fechaEventoUtil.getTime());

                    // Ahora tienes los datos validados, puedes proceder con la lógica de tu aplicación
                    cotizacion cotizacion = new cotizacion();
                    cotizacion.setCodigoCotizacion(idCotizacion);
                    cotizacion.setTipoCotizacion(tipoEvento);
                    cotizacion.setUbicacion(ubicacion);
                    cotizacion.setFechaParcialEvento(fechaEvento);
                    cotizacion.setValorCotizacion(valorCotizacion);
                    cotizacion.setCantidadPersonas(cantidad);
                    cotizacion.setCorreo(correo);

                    boolean exito = cotizacionDAO.actualizar(cotizacion);
                    if (exito) {
                        System.out.println("Actualización de cotización exitosa");
                    } else {
                        System.out.println("Actualización de cotización errónea");
                    }
                } catch (NumberFormatException | ParseException e) {
                    // Manejo de excepciones
                    System.out.println("Error: " + e.getMessage());
                }
            } else {
                // En caso de que algún parámetro sea nulo o vacío
                System.out.println("Error: Todos los campos son obligatorios.");
            }

            int index = Integer.parseInt(request.getParameter("total_iterations"));
            for (int i = 0; i < index; i++) {
                String cantidad = request.getParameter("service_quantity_" + i);
                int cantidadInt = Integer.parseInt(cantidad);
                if (cantidadInt > 0) {
                    String nombreServicio = request.getParameter("service_name_" + i);
                    String precioServicio = request.getParameter("service_price_" + i);
                    String precioTotalServicio = request.getParameter("service_total_price_" + i);
                    System.out.println(cantidadInt + " " + nombreServicio + " " + precioServicio + " " + precioTotalServicio);
                    System.out.println("Inicio de paso de parametros a la clase");
                    servicio servicio = new servicio();
                    cotizacionServicio cotSerDecoracion = new cotizacionServicio();
                    servicioDAO servicioDAO = new servicioDAO();
                    cotizacionServicioDAO cotizacionServicioDAO = new cotizacionServicioDAO();
                    String IdServicio = servicioDAO.consultarIdServicio(nombreServicio);
                    servicio.setServicioId(IdServicio);
                    servicio.setServicioNombre(nombreServicio);
                    cotSerDecoracion.setCantidad(cantidadInt);
                    int precioTotal = Integer.parseInt(precioTotalServicio);
                    cotSerDecoracion.setPrecioTotal(precioTotal);
                    boolean exito = cotizacionServicioDAO.actualizarServiciosCotizacion(idCotizacion, IdServicio, cantidadInt, precioTotal);
                    System.out.println("exitoActualizacion = " + exito);
                }
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
            Logger.getLogger(CotizacionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
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
        } catch (ParseException ex) {
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
