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
import java.util.ArrayList;
import java.util.List;

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

    public List<Object[]> listarEventos() {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT e.idEvento, c.Nombre_Cotizante, c.Apellido_Cotizante, e.Tipo_evento, e.Estado_evento FROM evento e "
                + "JOIN cliente cl ON e.Cliente_idCliente = cl.idCliente "
                + "JOIN cotizante c ON cl.Correo_cotizante = c.Correo_Cotizante";
        try {
            ps = con.prepareStatement(sql);
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
                evento.setFechaEvento(rs.getDate("Fecha_evento"));
                evento.setEstadoEvento(rs.getString("Estado_evento"));
                evento.setDescripcionEvento(rs.getString("Descripcion_evento"));
                cotizacion.setCantidadPersonas(rs.getInt("Cantidad_Personas_Cotización"));

                // Crear la lista de servicios para este evento
                String[] nombresServicios = rs.getString("Nombres_Servicios").split(", ");
                String[] valoresServicios = rs.getString("Valor_Servicios").split(", ");
                String[] cantidad = rs.getString("Cantidad").split(", ");
                String[] valorUnitario = rs.getString("Valor_Unitario").split(", ");
                String[] tipoServicio = rs.getString("Tipo_Servicio").split(", ");
                cliente.setCltId(rs.getString("idCliente"));

                if (nombresServicios.length == valorUnitario.length
                        && nombresServicios.length == cantidad.length
                        && nombresServicios.length == valoresServicios.length
                        && nombresServicios.length == tipoServicio.length) {

                    List<Object[]> listaServicios = new ArrayList<>();

                    // Agregar cada servicio a la lista de servicios
                    for (int i = 0; i < nombresServicios.length; i++) {
                        servicio serv = new servicio();
                        serv.setServicioNombre(nombresServicios[i]);
                        serv.setServicioValor(Integer.parseInt(valoresServicios[i]));

                        eventoServicio eventoServicio = new eventoServicio();
                        eventoServicio.setCantidad(Integer.parseInt(cantidad[i]));
                        // Agregar más propiedades si es necesario

                        Object[] servicioArray = {
                            serv.getServicioNombre(),
                            serv.getServicioValor(),
                            eventoServicio.getCantidad()
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
                        cliente.getCltId()
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

}


