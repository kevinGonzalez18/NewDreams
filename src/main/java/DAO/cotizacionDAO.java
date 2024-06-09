package DAO;

import Modelo.conexion;
import Modelo.cotizacion;
import Modelo.cotizacionServicio;
import Modelo.cotizante;
import Modelo.evento;
import Modelo.servicio;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class cotizacionDAO {

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;

    public List<Object[]> listarCotizaciones() {
        cotizacion cotizacion = new cotizacion();
        cotizante cotizante = new cotizante();
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT * FROM vista_cotizaciones WHERE Deleted = 0";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cotizacion.setCodigoCotizacion(rs.getString("No_Cotizacion"));
                cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                cotizante.setCotizanteTelefono(rs.getString("Telefono_Cotizante"));
                cotizante.setCotizanteCorreo(rs.getString("Correo_Cotizante"));
                cotizacion.setTipoCotizacion(rs.getString("Tipo_Cotizacion"));
                Object[] cotizacionArray = {cotizacion.getCodigoCotizacion(), cotizante.getCotizanteNombre(), cotizante.getCotizanteApellido(), cotizante.getCotizanteTelefono(), cotizante.getCotizanteCorreo(), cotizacion.getTipoCotizacion()};
                lista.add(cotizacionArray);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }

    public boolean agregar(cotizacion cot) {
        String sql = "CALL SP_INSERT_COTIZACION (?, ?, ?, ?, ?, ?, ?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cot.getTipoCotizacion());
            ps.setString(2, cot.getUbicacion());
            ps.setTimestamp(3, (Timestamp) cot.getFechaParcialEvento());
            ps.setTimestamp(4, (Timestamp) cot.getFechaCotizacion());
            ps.setInt(5, cot.getValorCotizacion());
            ps.setInt(6, cot.getCantidadPersonas());
            ps.setString(7, cot.getCorreo());
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                exito = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exito;
    }

    // Método para consultar el último ID de cotización generado
    public String consultarUltimoIdCotizacion() throws SQLException {
        String sql = "SELECT No_Cotizacion FROM cotización ORDER BY No_Cotizacion DESC LIMIT 1";
        try (PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("No_Cotizacion");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Object[]> consultarCotizacionPorID(String idCotizacion) throws SQLException {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT * FROM vista_cotizaciones WHERE No_Cotizacion = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idCotizacion);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Crear objeto cotizacion y llenar sus campos
                    cotizacion cotizacion = new cotizacion();
                    cotizacion.setCodigoCotizacion(rs.getString("No_Cotizacion"));

                    // Crear objeto cotizante y llenar sus campos
                    cotizante cotizante = new cotizante();
                    cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                    cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                    cotizante.setCotizanteTelefono(rs.getString("Telefono_Cotizante"));
                    cotizante.setCotizanteCorreo(rs.getString("Correo_Cotizante"));

                    cotizacion.setTipoCotizacion(rs.getString("Tipo_Cotizacion"));
                    cotizacion.setCantidadPersonas(rs.getInt("Cantidad_Personas_Cotización"));
                    cotizacion.setUbicacion(rs.getString("Ubicacion"));
                    cotizacion.setFechaParcialEvento(rs.getTimestamp("Fecha_Parcial_Evento_Cotización"));
                    cotizacion.setFechaCotizacion(rs.getTimestamp("Fecha_Hora_Cotizacion"));
                    cotizacion.setValorCotizacion(rs.getInt("Valor_Cotización"));

                    // Extraer detalles de los servicios
                    String[] servicios = rs.getString("Servicios").split(", ");
                    String[] valorUnitario = rs.getString("Valor_Unitario").split(", ");
                    String[] cantidad = rs.getString("Cantidad").split(", ");
                    String[] valorTotal = rs.getString("Valor_Total").split(", ");
                    String[] tipoServicio = rs.getString("Tipo_Servicio").split(", ");

                    // Verificar si las longitudes de los arrays son consistentes
                    if (servicios.length == valorUnitario.length
                            && servicios.length == cantidad.length
                            && servicios.length == valorTotal.length
                            && servicios.length == tipoServicio.length) {

                        // Lista para almacenar los arrays de servicios
                        List<Object[]> serviciosList = new ArrayList<>();

                        // Iterar sobre los servicios y crear objetos para cada uno
                        for (int i = 0; i < servicios.length; i++) {
                            servicio servicio = new servicio();
                            servicio.setServicioNombre(servicios[i]);
                            servicio.setServicioValor(Integer.parseInt(valorUnitario[i]));
                            servicio.setServicioTipo(tipoServicio[i]);

                            cotizacionServicio cotizacionServicio = new cotizacionServicio();
                            cotizacionServicio.setCantidad(Integer.parseInt(cantidad[i]));
                            cotizacionServicio.setPrecioTotal(Integer.parseInt(valorTotal[i]));

                            Object[] servicioArray = {
                                servicio.getServicioNombre(),
                                servicio.getServicioValor(),
                                servicio.getServicioTipo(),
                                cotizacionServicio.getCantidad(),
                                cotizacionServicio.getPrecioTotal()
                            };

                            serviciosList.add(servicioArray);
                        }

                        // Crear un array comprensivo incluyendo los detalles de la cotización y los servicios
                        Object[] cotizacionArray = {
                            cotizacion.getCodigoCotizacion(),
                            cotizante.getCotizanteNombre(),
                            cotizante.getCotizanteApellido(),
                            cotizante.getCotizanteCorreo(),
                            cotizante.getCotizanteTelefono(),
                            cotizacion.getTipoCotizacion(),
                            cotizacion.getCantidadPersonas(),
                            cotizacion.getFechaCotizacion(),
                            cotizacion.getFechaParcialEvento(),
                            cotizacion.getUbicacion(),
                            cotizacion.getValorCotizacion(),
                            serviciosList.toArray(new Object[0][])
                        };
                        lista.add(cotizacionArray);
                    } else {
                        // Manejar longitudes de datos inconsistentes si es necesario
                        System.err.println("Inconsistent data lengths in service details for cotizacion ID: " + idCotizacion);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;  // Re-lanzar la excepción después de registrarla
        }
        return lista;
    }

    public void addServicesToCotizacion(String eventId, List<String> serviceIds) throws SQLException {
        String sql = "CALL SP_INSERT_COTIZACIONSERVICIO (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            for (String serviceId : serviceIds) {
                ps.setString(1, eventId);
                ps.setString(2, serviceId);
                ps.setInt(3, 0);
                ps.setInt(4, 0);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;  // Re-lanzar la excepción para que el método llamante pueda manejarla
        }
    }

    public boolean actualizar(cotizacion cot) throws SQLException {
        String sql = "CALL SP_UPDATE_COTIZACION (?, ?, ?, ?, ?, ?, ?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cot.getCodigoCotizacion());
            ps.setString(2, cot.getTipoCotizacion());
            ps.setString(3, cot.getUbicacion());
            ps.setTimestamp(4, (Timestamp) cot.getFechaParcialEvento());
            ps.setInt(5, cot.getValorCotizacion());
            ps.setInt(6, cot.getCantidadPersonas());
            ps.setString(7, cot.getCorreo());
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

    public boolean deletedCotizacion(String idCotizacion) throws SQLException {
        String sql = "UPDATE cotización SET Deleted = 1 WHERE No_Cotizacion = ?";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idCotizacion);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0){
                exito = true;
            }
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            throw e; // Lanza la excepción para indicar que la actualización falló
        }
        return exito;
    }

    public boolean checkIfClienteExists(String correo) throws SQLException {
        String sql = "SELECT COUNT(*) FROM cliente WHERE Correo_cotizante = ?";
        boolean existe = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return existe;
    }
    
    public boolean crearEvento(evento evento, int idAdmin, String idCot, String idCli) throws SQLException{
        String sql = "CALL SP_INSERT_EVENTO (?, ?, ?, ?, ?, ?, ?)";
        boolean exito = false;
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, evento.getTipoEvento());
            ps.setInt(2, evento.getValorEvento());
            ps.setTimestamp(3, (Timestamp) evento.getFechaEvento());
            ps.setString(4, evento.getDescripcionEvento());
            ps.setInt (5, idAdmin);
            ps.setString(6, idCot);
            ps.setString(7, idCli);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0){
                exito = true;
            }
        } catch (SQLException e){
            e.printStackTrace();
            throw e;
        }
        return exito;
    }
    
    public void covertirCotizacionEnEvento() {
        String procedureCall = "{CALL SP_UPDATE_EVENTO_INTO_COTIZACION()}";
        try (CallableStatement cs = con.prepareCall(procedureCall)) {
            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
