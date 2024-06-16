 package DAO;

import Modelo.conexion;
import Modelo.servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class servicioDAO {

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;
    servicio ser = new servicio();

    //Metodo para consultar los registros de la base de datos en la tabla servicios
    public List<servicio> consultarTodosServicios() throws SQLException {
        List<servicio> lista = new ArrayList<>();
        String sql = "CALL SP_READLIST_SERVICIO";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                //ser.setServicioDescripcion(rs.getString(5));
                lista.add(ser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return lista;
    }

    public List<servicio> consultarServiciosManteleria() {
        List<servicio> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE Tipo_Servicio = 'Manteleria' AND Deleted = 0";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                lista.add(ser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<servicio> consultarServiciosMesasSillas() {
        List<servicio> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE Tipo_Servicio = 'Mesas y sillas' AND Deleted = 0";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                lista.add(ser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<servicio> consultarServiciosDecoracion() {
        List<servicio> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE Tipo_Servicio = 'Decoracion' AND Deleted = 0";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                lista.add(ser);
            }
            System.out.println(lista);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public String consultarIdServicio(String nombre) throws SQLException {
        String sql = "SELECT IdServicio FROM servicio WHERE Nombre_Servicio = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("IdServicio");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            ps.close();
            rs.close();
        }
        // If the service ID is not found, you may return null or throw an exception
        return null;
    }

    public boolean agregar(servicio servicio) throws SQLException {
        String sql = "CALL SP_INSERT_SERVICIO(?, ?, ?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, servicio.getServicioNombre());
            ps.setInt(2, servicio.getServicioValor());
            ps.setString(3, servicio.getServicioTipo());
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

    public boolean actualizar(servicio servicio) throws SQLException {
        String sql = "CALL SP_UPDATE_SERVICIO (?, ?, ?, ?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, servicio.getServicioId());
            ps.setInt(2, servicio.getServicioValor());
            ps.setString(4, servicio.getServicioTipo());
            ps.setString(3, servicio.getServicioNombre());
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

    public boolean eliminar(String idServicio) throws SQLException {
        String sql = "CALL SP_DELETE_SERVICIO(?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idServicio);
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

}
