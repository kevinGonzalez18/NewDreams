package DAO;

import Modelo.conexion;

import Modelo.cotizacion;
import Modelo.cotizante;
import Modelo.evento;
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
                /*evento[1] = rs.getString("Nombre_Cotizante");
                evento[2] = rs.getString("Apellido_Cotizante");
                evento[3] = rs.getString("Tipo_evento");
                evento[4] = rs.getString("Estado_evento"); // Dividir servicios concatenados en un array de Strings*/
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
        String sql = "SELECT c.Nombre_Cotizante, c.Apellido_Cotizante, c.Correo_Cotizante, c.Telefono_Cotizante, e.idEvento, e.Tipo_evento, "
                + "e.Fecha_evento, e.Estado_evento, e.Tematica_evento, e.Descripcion_evento, ct.Cantidad_Personas_Cotización FROM evento e "
                + "JOIN cotización ct ON e.Cotizacion_No_Cotizacion = ct.No_Cotizacion JOIN cliente cl ON e.Cliente_idCliente = cl.idCliente "
                + "JOIN cotizante c ON cl.Correo_cotizante = c.Correo_Cotizante "
                + "WHERE e.idEvento = ?";
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
                evento.setTematicaEvento(rs.getString("Tematica_evento"));
                evento.setDescripcionEvento(rs.getString("Descripcion_evento"));
                cotizacion.setCantidadPersonas(rs.getInt("Cantidad_Personas_Cotización"));

                // Crear la lista de servicios para este evento
                List<servicio> listaServicios = new ArrayList<>();
                String nombresServicios = rs.getString("Nombres_Servicios");
                String valoresServicios = rs.getString("Valor_Servicios");
                String[] nombres = nombresServicios.split(",");
                String[] valores = valoresServicios.split(",");

                // Agregar cada servicio a la lista de servicios
                for (int i = 0; i < nombres.length; i++) {
                    servicio serv = new servicio();
                    serv.setServicioNombre(nombres[i]);
                    serv.setServicioValor(Integer.parseInt(valores[i]));
                    // Agregar más propiedades si es necesario
                    listaServicios.add(serv);
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
                    evento.getTematicaEvento(),
                    evento.getDescripcionEvento(),
                    cotizacion.getCantidadPersonas(),
                    listaServicios // Agregar la lista de servicios al array
                };
                lista.add(eventoArray);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
            // Aquí puedes manejar la excepción de acuerdo a tus necesidades
        }
        return lista;
    }

}
