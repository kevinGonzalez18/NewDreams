/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.conexion;
import Modelo.cotizacion;
import Modelo.cotizacionServicio;
import Modelo.servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class cotizacionServicioDAO {

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;
    cotizacion cot = new cotizacion();
    servicio servicio = new servicio();
    cotizacionServicio cotizacionServicio = new cotizacionServicio();

    public boolean insertarServiciosCotizacion(String cotizacion, String servicio, int cantidad, int precio) throws SQLException {
        String sql = "CALL SP_INSERT_COTIZACIONSERVICIO (?, ?, ?, ?)";
        boolean exitoInsercion = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cotizacion);
            ps.setString(2, servicio);
            ps.setInt(3, cantidad);
            ps.setInt(4, precio);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                exitoInsercion = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return exitoInsercion;
    }
}
