package Controlador;

import DAO.cotizacionDAO;
import DAO.cotizanteDAO;
import DAO.servicioDAO;
import Modelo.cotizacion;
import Modelo.cotizante;
import Modelo.servicio;
import Modelo.cotizacionServicio;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormServlet extends HttpServlet {

    servicioDAO servicioDAO = new servicioDAO();
    cotizanteDAO cotizanteDAO = new cotizanteDAO();
    cotizacionDAO cotizacionDAO = new cotizacionDAO();
    cotizante cotizante = new cotizante();
    cotizacion cotizacion = new cotizacion();
    servicio servicio = new servicio();
    cotizacionServicio cotizacionServicio = new cotizacionServicio();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        String accion = request.getParameter("accion");
        String menu = request.getParameter("menu");
        String crearcotizacion = request.getParameter("crearcotizacion");
        if (menu != null && menu.equals("form")) {
            switch (accion) {
                case "listar":
                    List<servicio> lista = servicioDAO.consultarTodosServicios();
                    List<servicio> manteleria = servicioDAO.consultarServiciosManteleria();
                    List<servicio> mesasysillas = servicioDAO.consultarServiciosMesasSillas();
                    List<servicio> decoracion = servicioDAO.consultarServiciosDecoracion();
                    request.setAttribute("servicios", lista);
                    request.setAttribute("manteleria", manteleria);
                    request.setAttribute("mesasysillas", mesasysillas);
                    request.setAttribute("decoracion", decoracion);
            }
            request.getRequestDispatcher("form.jsp").forward(request, response);
        }

        if (crearcotizacion != null && crearcotizacion.equals("crearcotizacion")) {
            String nombreCotizante = request.getParameter("name");
            System.out.println(nombreCotizante);
            String apellidoCotizante = request.getParameter("last-name");
            String correoCotizante = request.getParameter("email");
            String telefonoCotizante = request.getParameter("phone");
            cotizante.setCotizanteNombre(nombreCotizante);
            cotizante.setCotizanteApellido(apellidoCotizante);
            cotizante.setCotizanteCorreo(correoCotizante);
            cotizante.setCotizanteTelefono(telefonoCotizante);
            if (nombreCotizante != null && !nombreCotizante.isEmpty() && apellidoCotizante != null && !apellidoCotizante.isEmpty()
                    && correoCotizante != null && !correoCotizante.isEmpty() && telefonoCotizante != null && !telefonoCotizante.isEmpty()) {
                boolean exitoInsercion = cotizanteDAO.agregar(cotizante);
                if (exitoInsercion) {
                    // La inserción fue exitosa
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    // La inserción falló, manejar el error aquí
                    // Puedes redirigir a una página de error o mostrar un mensaje al usuario
                    // Por ejemplo:
                    response.getWriter().println("Error al insertar en la base de datos");
                }
            }
            System.out.println("Completo la insercion de usuario");
            String tipoCotizacion = request.getParameter("item_type");
            System.out.println("Tipo de cotizacion: " + tipoCotizacion);
            String ubicacion = request.getParameter("event_location");
            System.out.println("Lugar del evento: " + ubicacion);
            int cantidadPersonasEvento = Integer.parseInt(request.getParameter("quantity"));
            System.out.println("Cantidad de personas: " + cantidadPersonasEvento);
            String fechaEventoStr = request.getParameter("event_date");
            String fechaCotizacionStr = request.getParameter("current_date");
            int valorCotizacion = Integer.parseInt(request.getParameter("total_order_price"));
            System.out.println("Valor de la coizacion: " + valorCotizacion);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // Formato de fecha del formulario

            java.util.Date fechaEventoUtil = dateFormat.parse(fechaEventoStr);
            java.sql.Timestamp fechaEvento = new java.sql.Timestamp(fechaEventoUtil.getTime());
            System.out.println("fechaEvento: " + fechaEvento);

            java.util.Date fechaCotizacionUtil = dateFormat.parse(fechaCotizacionStr);
            java.sql.Timestamp fechaCotizacion = new java.sql.Timestamp(fechaCotizacionUtil.getTime());
            System.out.println("fechaCotizacion: " + fechaCotizacion);

            System.out.println("Obtuvo los parametros de la cotizacion");
            cotizacion.setTipoCotizacion(tipoCotizacion);
            if (ubicacion != null && !ubicacion.isEmpty()) {
                if (ubicacion.equals("buscar")) {
                    cotizacion.setUbicacion("La empresa buscará el lugar del evento");
                } else if (ubicacion.equals("tengo")) {
                    String lugarEvento = request.getParameter("event_name");
                    String direccionEvento = request.getParameter("event_address");
                    String barrioEvento = request.getParameter("event_neighborhood");
                    cotizacion.setUbicacion(lugarEvento + ", " + direccionEvento + ", " + barrioEvento);
                }
            }
            cotizacion.setFechaParcialEvento(fechaEvento);
            cotizacion.setFechaCotizacion(fechaCotizacion);
            cotizacion.setValorCotizacion(valorCotizacion);
            cotizacion.setCantidadPersonas(cantidadPersonasEvento);
            cotizacion.setCorreo(correoCotizante);

            System.out.println("Envio los parametros a la clase");
            if (tipoCotizacion != null && !tipoCotizacion.isEmpty()
                    && ubicacion != null && !ubicacion.isEmpty()
                    && cantidadPersonasEvento != 0
                    && fechaEvento != null && fechaCotizacion != null
                    && valorCotizacion != 0
                    && correoCotizante != null && !correoCotizante.isEmpty()) {
                boolean exitoInsercion = cotizacionDAO.agregar(cotizacion);
                System.out.println("El resultado del metodo es: " + exitoInsercion);
                if (!exitoInsercion) {
                    // La inserción falló, manejar el error aquí
                    // Puedes redirigir a una página de error o mostrar un mensaje al usuario
                    // Por ejemplo:
                    response.getWriter().println("Error al insertar en la base de datos");
                }
            }
            System.out.println("Inicio de obtencion de servicios");
            for (int i = 0; i >=4; i++){
                String cantidad = request.getParameter("service_quantity_manteleria_" + i);
                System.out.println(cantidad);
                
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
        } catch (ParseException ex) {
            Logger.getLogger(FormServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(FormServlet.class.getName()).log(Level.SEVERE, null, ex);
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
