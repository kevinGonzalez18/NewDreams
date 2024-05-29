/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Modelo.cliente;
import Modelo.conexion;
import Modelo.cotizante;
import Modelo.evento;
import Modelo.pago;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author kevin
 */
public class pagoDAO {

    pago pago = new pago();
    cotizante cotizante = new cotizante();
    cliente cliente = new cliente();
    evento evento = new evento();

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;

    public List<Object[]> ListarPagos(String idCliente, int idEvento) {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT p.No_Pagos, p.Referente, c.Nombre_Cotizante, c.Apellido_Cotizante, p.Dia_hora_pagos, p.Valor_pagos, cl.idCliente, e.idEvento  FROM pagos p "
                + "JOIN cliente cl ON p.Evento_Cliente_idCliente = cl.idCliente "
                + "JOIN cotizante c ON cl.Correo_cotizante = c.Correo_Cotizante "
                + "JOIN evento e ON p.Evento_idEvento = e.idEvento "
                + "WHERE p.Evento_Cliente_idCliente = ? AND p.Evento_idEvento = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idCliente);
            ps.setInt(2, idEvento);
            rs = ps.executeQuery();
            while (rs.next()) {
                pago.setIdPagos(rs.getString("No_Pagos"));
                pago.setReferente(rs.getInt("Referente"));
                cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                pago.setFechaPagos(rs.getDate("Dia_hora_pagos"));
                pago.setValorPagos(rs.getInt("Valor_pagos"));
                cliente.setCltId(rs.getString("idCliente"));
                evento.setEventoId(rs.getInt("idEvento"));
                Object[] pagoArray = {pago.getIdPagos(), pago.getReferente(), cotizante.getCotizanteNombre(), cotizante.getCotizanteApellido(), pago.getFechaPagos(),
                    pago.getValorPagos(), cliente.getCltId(), evento.getEventoId()};
                lista.add(pagoArray);

            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }

    public boolean RegistrarPago(String Nombre, String Apellido, Date fecha, int Valor, int idEvento, String idCliente) {
        String sql = "CALL SP_INSERT_PAGOS(?, ?, ?, ?, ?, ?)";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, Nombre);
            ps.setString(2, Apellido);
            ps.setDate(3, (java.sql.Date) fecha);
            ps.setInt(4, Valor);
            ps.setInt(5, idEvento);
            ps.setString(6, idCliente);
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                exito = true;

            }

        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir el error
        }
        return exito;
    }

}
