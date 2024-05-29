package DAO;

import Modelo.cliente;
import Modelo.conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class clienteDAO {

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;
    int agregarCliente;

    // Método para validar las credenciales del cliente mediante correo y contraseña
    public boolean validarCrendenciales(String correo, String contraseña) {
        boolean resultado = false; // Variable para almacenar el resultado de la validación

        try {
            // Se establece la conexión a la base de datos utilizando la clase 'conexion'
            Connection con = new conexion().conectar();

            // Se define la consulta SQL para verificar las credenciales del cliente y su estado
            String query = "SELECT COUNT(*) FROM Cliente WHERE Correo_cotizante = ? AND Contraseña_Cliente = ? AND Estado_Cliente = 'Habilitado'";

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

        // Se devuelve el resultado de la validación de las credenciales del cliente
        return resultado;
    }

    public String obtenerEstadoCliente(String correo) {
        String estadoCliente = "";

        try {
            // Se establece la conexión a la base de datos utilizando la clase 'conexion'
            Connection con = new conexion().conectar();

            // Se define la consulta SQL para obtener el estado del cliente
            String query = "SELECT Estado_Cliente FROM Cliente WHERE Correo_cotizante = ?";

            // Se prepara la consulta SQL
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, correo); // Se establece el primer parámetro (correo) en la consulta

            // Se ejecuta la consulta y se obtiene el resultado
            ResultSet rs = pst.executeQuery();

            // Si la consulta devuelve algún resultado
            if (rs.next()) {
                estadoCliente = rs.getString("Estado_Cliente"); // Obtener el estado del cliente
            }

            // Se cierran los recursos de base de datos para liberar memoria y conexiones
            rs.close();
            pst.close();
            con.close();
        } catch (SQLException ex) { // Se capturan las excepciones de SQL en caso de algún error
            ex.printStackTrace(); // Se imprime el rastreo de la pila de excepciones en la consola
        }

        // Se devuelve el estado del cliente
        return estadoCliente;
    }

    public List<Object[]> listarClientes() {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT C.Correo_Cotizante, C.Nombre_Cotizante, C.Apellido_Cotizante, C.Telefono_Cotizante, Cl.idCliente, Cl.Contraseña_Cliente, Cl.Estado_Cliente "
                + "FROM Cotizante C JOIN Cliente Cl ON C.Correo_Cotizante = Cl.Correo_cotizante GROUP BY Cl.idCliente";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] clienteCotizante = new Object[7];
                clienteCotizante[0] = rs.getString("Correo_Cotizante");
                clienteCotizante[1] = rs.getString("Nombre_Cotizante");
                clienteCotizante[2] = rs.getString("Apellido_Cotizante");
                clienteCotizante[3] = rs.getString("Telefono_Cotizante");
                clienteCotizante[4] = rs.getString("idCliente");
                clienteCotizante[5] = rs.getString("Contraseña_Cliente");
                clienteCotizante[6] = rs.getString("Estado_Cliente");
                lista.add(clienteCotizante);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }

    // Método para listar un cliente por su ID
    public List<Object[]> listarClienteId(String id) {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT C.Correo_Cotizante, C.Nombre_Cotizante, C.Apellido_Cotizante, C.Telefono_Cotizante, Cl.idCliente, Cl.Contraseña_Cliente, Cl.Estado_Cliente "
                + "FROM Cotizante C JOIN Cliente Cl ON C.Correo_Cotizante = Cl.Correo_cotizante WHERE Cl.Correo_cotizante = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] cliente = new Object[7]; // Ajusta el tamaño del arreglo según las columnas de la tabla cliente
                cliente[0] = rs.getString("Correo_Cotizante");
                cliente[1] = rs.getString("Nombre_Cotizante");
                cliente[2] = rs.getString("Apellido_Cotizante");
                cliente[3] = rs.getString("Telefono_Cotizante");
                cliente[4] = rs.getString("idCliente");
                cliente[5] = rs.getString("Contraseña_Cliente");
                cliente [6] = rs.getString("Estado_Cliente");
                lista.add(cliente);
            }
            // Imprimir los datos de cada cliente en la lista
            for (Object[] cliente : lista) {
                System.out.println("La persona que esta consultado es: ");
                for (Object dato : cliente) {
                    System.out.print(dato + " ");
                }
                System.out.println(); // Agregar un salto de línea después de cada cliente
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }

    public int agregar(cliente clt) {
        String sql = "CALL SP_INSERT_CLIENTE (?, ?)";
        int filasAfectadas = 0;

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, clt.getCltContraseña());
            ps.setString(2, clt.getCltCorreo());

            filasAfectadas = ps.executeUpdate();
        } catch (SQLException e) {
            // Manejar la excepción adecuadamente, por ejemplo, imprimir el error
            e.printStackTrace();
        } finally {
            // Cerrar la conexión y la declaración preparada en el bloque finally
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                // Manejar la excepción si hay un error al cerrar la declaración preparada
                e.printStackTrace();
            }
        }

        return filasAfectadas; // Devolver el número de filas afectadas por la operación de inserción
    }
    public void covertirCotizanteEnCliente() {
        String procedureCall = "{CALL SP_UPDATE_CLIENTE_INTO_COTIZANTE()}";
        try (CallableStatement cs = con.prepareCall(procedureCall)) {
            cs.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Metoodo que permite actualizar los datos del cliente, desde el apartado de cliente
    public void update(String correo, String nombre, String apellido, String telefono) throws SQLException {
        String sql = "UPDATE cotizante SET Nombre_Cotizante = ?, Apellido_Cotizante = ?, "
                + "Telefono_Cotizante = ? WHERE Correo_Cotizante = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, correo);
            int rowsAffected = ps.executeUpdate();
            System.out.println("Filas actualizadas: " + rowsAffected);

            ps.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            throw e; // Lanza la excepción para indicar que la actualización falló
        }
    }
    
    public void updateCliente(String correo, String estado) throws SQLException{
        String sql = "UPDATE cliente SET Estado_Cliente = ? WHERE Correo_Cotizante = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            ps.setString(2, correo);
            int rowsAffected = ps.executeUpdate();
            System.out.println("Filas actualizadas: " + rowsAffected);

            ps.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            throw e; // Lanza la excepción para indicar que la actualización falló
        }
    }
}
