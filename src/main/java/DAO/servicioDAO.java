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
    public List<servicio> consultarTodosServicios() {
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
                ser.setServicioDescripcion(rs.getString(5));
                lista.add(ser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            // Asegúrate de cerrar los recursos
            try { if (rs != null) rs.close(); } catch (Exception e) {};
            try { if (ps != null) ps.close(); } catch (Exception e) {};
            try { if (con != null) con.close(); } catch (Exception e) {};
        }
        return lista;
    }

    public List<servicio> consultarServiciosManteleria() {
        List<servicio> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE Tipo_Servicio = 'Manteleria'";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                ser.setServicioDescripcion(rs.getString(5));
                lista.add(ser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<servicio> consultarServiciosMesasSillas() {
        List<servicio> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE Tipo_Servicio = 'Mesas y sillas'";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                ser.setServicioDescripcion(rs.getString(5));
                lista.add(ser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<servicio> consultarServiciosDecoracion() {
        List<servicio> lista = new ArrayList<>();
        String sql = "SELECT * FROM servicio WHERE Tipo_Servicio = 'Decoracion'";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                servicio ser = new servicio();
                ser.setServicioId(rs.getString(1));
                ser.setServicioValor(rs.getInt(2));
                ser.setServicioNombre(rs.getString(3));
                ser.setServicioTipo(rs.getString(4));
                ser.setServicioDescripcion(rs.getString(5));
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

}
