package DAO;

import Modelo.cliente;
import Modelo.conexion;

import Modelo.cotizacion;
import Modelo.cotizacionServicio;
import Modelo.cotizante;
import Modelo.evento;
import Modelo.eventoServicio;
import Modelo.servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author kevin
 */
public class eventoDAO {

    evento evento = new evento();
    cotizante cotizante = new cotizante();
    cotizacion cotizacion = new cotizacion();
    cliente cliente = new cliente();

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;
    private static final String ESTADO_ACTIVO = "Activo";

    public List<Object[]> listarEventos() {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT e.idEvento, c.Nombre_Cotizante, c.Apellido_Cotizante, e.Tipo_evento, e.Estado_evento FROM evento e "
                + "JOIN cliente cl ON e.Cliente_idCliente = cl.idCliente "
                + "JOIN cotizante c ON cl.Correo_cotizante = c.Correo_Cotizante WHERE e.Estado_evento = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, ESTADO_ACTIVO);
            rs = ps.executeQuery();
            while (rs.next()) {
                evento.setEventoId(rs.getInt("idEvento"));
                cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                evento.setTipoEvento(rs.getString("Tipo_evento"));
                evento.setEstadoEvento(rs.getString("Estado_evento"));
                Object[] eventoArray = {evento.getEventoId(), cotizante.getCotizanteNombre(), cotizante.getCotizanteApellido(), evento.getTipoEvento(), evento.getEstadoEvento()};
                lista.add(eventoArray);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }

    public List<Object[]> DetallesEvento(int id) {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT * FROM vista_evento WHERE idEvento = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Obtener los demás campos
                cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                cotizante.setCotizanteCorreo(rs.getString("Correo_Cotizante"));
                cotizante.setCotizanteTelefono(rs.getString("Telefono_Cotizante"));
                evento.setEventoId(rs.getInt("idEvento"));
                evento.setTipoEvento(rs.getString("Tipo_evento"));
                evento.setFechaEvento(rs.getTimestamp("Fecha_evento"));
                evento.setEstadoEvento(rs.getString("Estado_evento"));
                evento.setDescripcionEvento(rs.getString("Descripcion_evento"));
                cotizacion.setCantidadPersonas(rs.getInt("Cantidad_Personas_Cotización"));

                // Crear la lista de servicios para este evento
                String[] nombresServicios = rs.getString("Nombres_Servicios").split(", ");
                String[] valoresServicios = rs.getString("Valor_Servicios").split(", ");
                String[] cantidad = rs.getString("Cantidad").split(", ");
                String[] valorUnitario = rs.getString("Valor_Unitario").split(", ");
                String[] tipoServicio = rs.getString("Tipo_Servicio").split(", ");
                String[] idServicio = rs.getString("idServicio").split(", ");
                cliente.setCltId(rs.getString("idCliente"));
                evento.setValorFinal(rs.getInt("Precio_Final"));

                if (nombresServicios.length == valorUnitario.length
                        && nombresServicios.length == cantidad.length
                        && nombresServicios.length == valoresServicios.length
                        && nombresServicios.length == tipoServicio.length
                        && nombresServicios.length == idServicio.length) {

                    List<Object[]> listaServicios = new ArrayList<>();

                    // Agregar cada servicio a la lista de servicios
                    for (int i = 0; i < nombresServicios.length; i++) {
                        servicio serv = new servicio();
                        serv.setServicioId(idServicio[i]);
                        serv.setServicioNombre(nombresServicios[i]);
                        serv.setServicioValor(Integer.parseInt(valorUnitario[i]));

                        eventoServicio eventoServicio = new eventoServicio();
                        eventoServicio.setCantidad(Integer.parseInt(cantidad[i]));
                        eventoServicio.setPrecioTotal(Integer.parseInt(valoresServicios[i]));
                        // Agregar más propiedades si es necesario

                        Object[] servicioArray = {
                            serv.getServicioNombre(),
                            eventoServicio.getPrecioTotal(),
                            eventoServicio.getCantidad(),
                            serv.getServicioValor(),
                            serv.getServicioId()
                        };
                        listaServicios.add(servicioArray);
                    }
                    Object[] eventoArray = {
                        cotizante.getCotizanteNombre(),
                        cotizante.getCotizanteApellido(),
                        cotizante.getCotizanteCorreo(),
                        cotizante.getCotizanteTelefono(),
                        evento.getEventoId(),
                        evento.getTipoEvento(),
                        evento.getFechaEvento(),
                        evento.getEstadoEvento(),
                        evento.getDescripcionEvento(),
                        cotizacion.getCantidadPersonas(),
                        listaServicios, // Agregar la lista de servicios al array
                        cliente.getCltId(),
                        evento.getValorFinal()
                    };
                    lista.add(eventoArray);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
            // Aquí puedes manejar la excepción de acuerdo a tus necesidades
        }
        return lista;
    }

    private static final String ESTADO_REALIZADO = "Realizado";

    public List<Object[]> listarEventosRealizados() {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT * FROM vista_evento WHERE Estado_evento = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, ESTADO_REALIZADO);
            rs = ps.executeQuery();
            while (rs.next()) {
                evento.setEventoId(rs.getInt("idEvento"));
                cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                evento.setTipoEvento(rs.getString("Tipo_evento"));
                evento.setEstadoEvento(rs.getString("Estado_evento"));
                Object[] eventoArray = {evento.getEventoId(), cotizante.getCotizanteNombre(), cotizante.getCotizanteApellido(), evento.getTipoEvento(), evento.getEstadoEvento()};
                lista.add(eventoArray);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }

    public boolean actualizarEvento(evento evento) throws SQLException {
        String sql = "CALL SP_UPDATE_EVENTO (?,?,?,?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, evento.getEventoId());
            ps.setInt(2, evento.getValorEvento());
            ps.setString(3, evento.getEstadoEvento());
            ps.setString(4, evento.getDescripcionEvento());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                exito = true;

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return exito;
    }

    public List<Object[]> listarEventosParaEncuesta() throws SQLException {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT e.idEvento, c.Nombre_Cotizante, c.Apellido_Cotizante, e.Tipo_evento, e.Estado_evento, e.encuesta_enviada, c.Correo_Cotizante FROM evento e "
                + "JOIN cliente cl ON e.Cliente_idCliente = cl.idCliente "
                + "JOIN cotizante c ON cl.Correo_cotizante = c.Correo_Cotizante";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idEvento = rs.getInt("idEvento");
                String nombreCotizante = rs.getString("Nombre_Cotizante");
                String apellidoCotizante = rs.getString("Apellido_Cotizante");
                String tipoEvento = rs.getString("Tipo_evento");
                String estadoEvento = rs.getString("Estado_evento");
                boolean encuestaEnviada = rs.getBoolean("encuesta_enviada");
                String correoCotizante = rs.getString("Correo_Cotizante");

                if (estadoEvento.equals("Realizado") && !encuestaEnviada) {
                    enviarCorreoEncuesta(idEvento, correoCotizante);
                    marcarEncuestaComoEnviada(idEvento);
                }

                Object[] eventoArray = {idEvento, nombreCotizante, apellidoCotizante, tipoEvento, estadoEvento, encuestaEnviada};
                lista.add(eventoArray);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return lista;
    }

    private void enviarCorreoEncuesta(int idEvento, String correoCliente) {
        String encuestaLink = "https://forms.gle/7spyzDxBveciDuBE7";
        String subject = "Encuesta de Satisfacción de Evento";
        String content = "<p>Estimado cliente,</p>"
                + "<p>Gracias por confiar en New Dreams para su evento. Por favor, complete la siguiente encuesta para ayudarnos a mejorar nuestros servicios:</p>"
                + "<a href='" + encuestaLink + "'>Encuesta de Satisfacción</a>";
        try {
            sendEmail(correoCliente, subject, content);
        } catch (MessagingException e) {
            e.printStackTrace();
            // Manejo de errores según sea necesario
        }
    }

    private void marcarEncuestaComoEnviada(int idEvento) throws SQLException {
        String sql = "UPDATE evento SET encuesta_enviada = TRUE WHERE idEvento = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, idEvento);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public static void sendEmail(String to, String subject, String content) throws MessagingException {
        String host = "smtp.gmail.com"; // Cambia esto por el servidor SMTP que utilices
        final String user = "gafeli29@gmail.com";
        final String password = "rsqpprgqsgfgkyny";

        // Configuración de las propiedades del servidor SMTP
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587"); // Cambia esto por el puerto que utilices

        // Obtener la sesión de correo
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // Crear un objeto MimeMessage
            Message message = new MimeMessage(session);

            // Configurar el remitente
            message.setFrom(new InternetAddress(user));

            // Configurar el destinatario
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));

            // Configurar el asunto del correo
            message.setSubject(subject);

            // Configurar el contenido del correo
            message.setContent(content, "text/html");

            // Enviar el correo
            Transport.send(message);

            System.out.println("Correo enviado exitosamente");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
