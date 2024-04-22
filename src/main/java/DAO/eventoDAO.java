
package DAO;

import Modelo.conexion;
import Modelo.cotizante;
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
}
