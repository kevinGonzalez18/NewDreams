package Controlador;

import DAO.cotizacionDAO;
import DAO.cotizacionServicioDAO;
import DAO.cotizanteDAO;
import DAO.servicioDAO;
import Modelo.cotizacion;
import Modelo.cotizante;
import Modelo.servicio;
import Modelo.cotizacionServicio;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
    cotizacionServicioDAO cotizacionServicioDAO = new cotizacionServicioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
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
            System.out.println("-------------------------------NOMBRE DEL COTIZANTE:" + nombreCotizante);
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
                System.out.println("El resultado de la insercion de la cotizacion es: " + exitoInsercion);
                if (exitoInsercion) {
                    System.out.println("Inicio de obtencion de servicios");
                    String IdCotizacion = cotizacionDAO.consultarUltimoIdCotizacion();
                    System.out.println("IdCotizacion = " + IdCotizacion);
                    cotizacion cotizacionServicios = new cotizacion();
                    cotizacionServicios.setCodigoCotizacion(IdCotizacion);

                    int loopIndexManteleria = Integer.parseInt(request.getParameter("total_iterations_manteleria"));
                    for (int i = 0; i < loopIndexManteleria; i++) {
                        String cantidadManteleria = request.getParameter("service_quantity_manteleria_" + i);
                        int cantidadInt = Integer.parseInt(cantidadManteleria);
                        if (cantidadInt > 0) {
                            String nombreManteleria = request.getParameter("service_name_manteleria_" + i);
                            String precioManteleria = request.getParameter("service_price_manteleria_" + i);
                            String precioTotalManteleria = request.getParameter("service_total_price_manteleria_" + i);
                            System.out.println(cantidadManteleria + " " + nombreManteleria + " " + precioManteleria + " " + precioTotalManteleria);
                            System.out.println("Inicio de paso de parametros a la clase");
                            servicio servicioManteleria = new servicio();
                            cotizacionServicio cotSerManteleria = new cotizacionServicio();
                            String IdServicio = servicioDAO.consultarIdServicio(nombreManteleria);
                            servicioManteleria.setServicioId(IdServicio);
                            servicioManteleria.setServicioNombre(nombreManteleria);
                            cotSerManteleria.setCantidad(cantidadInt);
                            int precioTotal = Integer.parseInt(precioTotalManteleria);
                            cotSerManteleria.setPrecioTotal(precioTotal);
                            boolean exito = cotizacionServicioDAO.insertarServiciosCotizacion(IdCotizacion, IdServicio, cantidadInt, precioTotal);
                            System.out.println("exitoManteleria = " + exito);
                        }
                    }
                    int loopIndexMesasSillas = Integer.parseInt(request.getParameter("total_iterations_mesasSillas"));
                    for (int i = 0; i < loopIndexMesasSillas; i++) {
                        String cantidadMesasSillas = request.getParameter("service_quantity_mesasSillas_" + i);
                        int cantidadInt = Integer.parseInt(cantidadMesasSillas);
                        if (cantidadInt > 0) {
                            String nombreMesasSillas = request.getParameter("service_name_mesasSillas_" + i);
                            String precioMesasSillas = request.getParameter("service_price_mesasSillas_" + i);
                            String precioTotalMesasSillas = request.getParameter("service_total_price_mesasSillas_" + i);
                            System.out.println(cantidadMesasSillas + " " + nombreMesasSillas + " " + precioMesasSillas + " " + precioTotalMesasSillas);
                            System.out.println("Inicio de paso de parametros a la clase");
                            servicio servicioMesasSillas = new servicio();
                            cotizacionServicio cotSerMesasSillas = new cotizacionServicio();
                            String IdServicio = servicioDAO.consultarIdServicio(nombreMesasSillas);
                            servicioMesasSillas.setServicioId(IdServicio);
                            servicioMesasSillas.setServicioNombre(nombreMesasSillas);
                            cotSerMesasSillas.setCantidad(cantidadInt);
                            int precioTotal = Integer.parseInt(precioTotalMesasSillas);
                            cotSerMesasSillas.setPrecioTotal(precioTotal);
                            boolean exito = cotizacionServicioDAO.insertarServiciosCotizacion(IdCotizacion, IdServicio, cantidadInt, precioTotal);
                            System.out.println("exitoMesassillas = " + exito);
                        }

                    }
                    int loopIndexDecoracion = Integer.parseInt(request.getParameter("total_iterations_decoracion"));
                    for (int i = 0; i < loopIndexDecoracion; i++) {
                        String cantidadDecoracion = request.getParameter("service_quantity_decoracion_" + i);
                        int cantidadInt = Integer.parseInt(cantidadDecoracion);
                        if (cantidadInt > 0) {
                            String nombreDecoracion = request.getParameter("service_name_decoracion_" + i);
                            String precioDecoracion = request.getParameter("service_price_decoracion_" + i);
                            String precioTotalDecoracion = request.getParameter("service_total_price_decoracion_" + i);
                            System.out.println(cantidadDecoracion + " " + nombreDecoracion + " " + precioDecoracion + " " + precioTotalDecoracion);
                            System.out.println("Inicio de paso de parametros a la clase");
                            servicio servicioDecoracion = new servicio();
                            cotizacionServicio cotSerDecoracion = new cotizacionServicio();
                            String IdServicio = servicioDAO.consultarIdServicio(nombreDecoracion);
                            servicioDecoracion.setServicioId(IdServicio);
                            servicioDecoracion.setServicioNombre(nombreDecoracion);
                            cotSerDecoracion.setCantidad(cantidadInt);
                            int precioTotal = Integer.parseInt(precioTotalDecoracion);
                            cotSerDecoracion.setPrecioTotal(precioTotal);
                            boolean exito = cotizacionServicioDAO.insertarServiciosCotizacion(IdCotizacion, IdServicio, cantidadInt, precioTotal);
                            System.out.println("exitoMesassillas = " + exito);
                        }
                    }
                    // Después de que se haya insertado correctamente la cotización
                    String destinatarioAdmin = "dfelipebr737@gmail.com";
                    String asunto = "Nueva cotización";
                    String mensaje = "Hola, administrador\nSe ha solicitado una nueva cotización.\n Detalles:\nNombre: " + nombreCotizante;
                    enviarCorreo(destinatarioAdmin, asunto, mensaje);
                } else {
                    // La inserción falló, manejar el error aquí
                    // Puedes redirigir a una página de error o mostrar un mensaje al usuario
                    // Por ejemplo:
                    response.getWriter().println("Error al insertar en la base de datos");
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
        } catch (ParseException ex) {
            Logger.getLogger(FormServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FormServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
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
        } catch (SQLException ex) {
            Logger.getLogger(FormServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
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

    public void enviarCorreo(String destinatario, String asunto, String mensaje) throws MessagingException {

        // Configuración del servidor de correo saliente (SMTP)
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // Ejemplo: smtp.gmail.com para Gmail
        props.put("mail.smtp.port", "587"); // Puerto SMTP (por ejemplo, 587 para Gmail)
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // Para habilitar TLS

        // Credenciales de inicio de sesión del remitente
        final String username = "gafeli29@gmail.com";
        final String password = "rsqpprgqsgfgkyny";

        // Crear una sesión de correo electrónico con autenticación
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Crear un mensaje de correo electrónico
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // Dirección de correo del remitente
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario)); // Dirección del destinatario
            message.setSubject(asunto); // Asunto del correo
            message.setText(mensaje); // Cuerpo del correo

            // Enviar el correo electrónico
            Transport.send(message);

            System.out.println("Correo electrónico enviado correctamente a: " + destinatario);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
