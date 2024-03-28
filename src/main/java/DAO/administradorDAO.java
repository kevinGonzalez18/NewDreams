package DAO;

import Modelo.conexion;
import java.sql.*;

public class administradorDAO {
    // Método para validar las credenciales del administrador mediante correo y contraseña
    public boolean validarCredenciales(String correo, String contraseña) {
        boolean resultado = false; // Variable para almacenar el resultado de la validación

        try {
            // Se establece la conexión a la base de datos utilizando la clase 'conexion'
            Connection con = new conexion().conectar();
            
            // Se define la consulta SQL para verificar las credenciales del administrador
            String query = "SELECT COUNT(*) FROM Administrador WHERE Correo_Admin = ? AND Contraseña_Admin = ?";
            
            // Se prepara la consulta SQL
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, correo); // Se establece el primer parámetro (correo) en la consulta
            pst.setString(2, contraseña); // Se establece el segundo parámetro (contraseña) en la consulta
            
            // Se ejecuta la consulta y se obtiene el resultado
            ResultSet rs = pst.executeQuery();
            
            // Si la consulta devuelve algún resultado
            if (rs.next()) {
                int count = rs.getInt(1); // Se obtiene el valor de la primera columna del resultado
                resultado = count == 1; // Si count es igual a 1, las credenciales son válidas y se establece 'resultado' como true
            }
            
            // Se cierran los recursos de base de datos para liberar memoria y conexiones
            rs.close();
            pst.close();
            con.close();
        } catch (SQLException ex) { // Se capturan las excepciones de SQL en caso de algún error
            ex.printStackTrace(); // Se imprime el rastreo de la pila de excepciones en la consola
        }
        
        // Se devuelve el resultado de la validación de las credenciales del administrador
        return resultado;
    }
}
