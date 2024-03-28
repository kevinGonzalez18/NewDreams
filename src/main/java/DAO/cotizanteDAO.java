
package DAO;

import Modelo.conexion;
import Modelo.cotizante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class cotizanteDAO {
   Connection con = new conexion().conectar();
   PreparedStatement ps;
   ResultSet rs;
   int agregarCotizante;

    public List<cotizante> listar() {
        List<cotizante> lista = new ArrayList<>();
        String sql = "CALL SP_READLIST_COTIZANTE";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(); // Asignar el resultado de la consulta a rs
            while (rs.next()) {
                cotizante cot = new cotizante();
                cot.setCotizanteCorreo(rs.getString(1));
                cot.setCotizanteNombre(rs.getString(2));
                cot.setCotizanteApellido(rs.getString(3));
                cot.setCotizanteTelefono(rs.getString(4));
                lista.add(cot);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }
    
    public int agregar (cotizante cot){
        String sql = "CALL SP_INSERT_COTIZANTE (?, ?, ?, ?, ?)";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, cot.getCotizanteCorreo());
            ps.setString(2, cot.getCotizanteNombre());
            ps.setString(3, cot.getCotizanteApellido());
            ps.setString(4, cot.getCotizanteTelefono());
            ps.executeUpdate();
        }catch(Exception e){
            e.toString();
        }
        return agregarCotizante;
    }
    
    public cotizante listarId(String correo){
        cotizante  cot = new cotizante();
        String sql = "CALL SP_READ_COTIZANTE('" + correo + "')";
        try{
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cot.setCotizanteCorreo(rs.getString(1));
                cot.setCotizanteNombre(rs.getString(2));
                cot.setCotizanteApellido(rs.getString(3));
                cot.setCotizanteTelefono(rs.getString(4));
            }
        }catch(Exception e){
            e.toString();
        }
        return cot;
    }
    
    public int actualizar(cotizante cot){
        String sql = "CALL SP_UPDATE_COTIZANTE (?, ?, ?, ?, ?)";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, cot.getCotizanteCorreo());
            ps.setString(2, cot.getCotizanteNombre());
            ps.setString(3, cot.getCotizanteApellido());
            ps.setString(4, cot.getCotizanteTelefono());
            ps.executeUpdate();
        }catch(Exception e){
            e.toString();
        }
        return agregarCotizante;
    }
    
    public void eliminar (String correo){
        String sql = "CALL SP_DELETE_COTIZANTE('" + correo + "')";
        try{
            ps= con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.toString();
        }
    }
}
