package DAO;

import Modelo.conexion;
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
                Object[] evento = new Object[5];
                evento[0] = rs.getInt("idEvento");
                evento[1] = rs.getString("Nombre_Cotizante");
                evento[2] = rs.getString("Apellido_Cotizante");
                evento[3] = rs.getString("Tipo_evento");
                evento[4] = rs.getString("Estado_evento"); // Dividir servicios concatenados en un array de Strings
                lista.add(evento);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }
}
