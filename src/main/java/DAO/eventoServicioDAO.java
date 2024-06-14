/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author feli1
 */
public class eventoServicioDAO {

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;

    public boolean insertarServiciosEvento(int evento, String servicio, int cantidad, int precio) throws SQLException {
        String sql = "CALL SP_INSERT_EVENTOSERVICIO (?, ?, ?, ?)";
        boolean exitoInsercion = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, evento);
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

    public String consultarUltimoIdEvento(String idCliente) throws SQLException {
        String sql = "CALL SP_OBTENER_ULTIMO_ID_EVENTO(?, @lastEventID)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idCliente);
            ps.execute();
            try (ResultSet rst = ps.executeQuery("SELECT @lastEventID AS lastEventID")) {
                if (rst.next()) {
                    return rst.getString("lastEventID");
                }
            }
        } catch (SQLException ex) {
            throw ex;
        }
        return null;
    }
}
