package DAO;

import Modelo.PasswordHasher;
import Modelo.cliente;
import Modelo.conexion;
import Modelo.cotizacion;
import Modelo.cotizante;
import Modelo.evento;
import Modelo.eventoServicio;
import Modelo.servicio;
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
        boolean resultado = false;

        try {
            Connection con = new conexion().conectar();

            // Modificamos la consulta SQL para obtener la contraseña encriptada
            String query = "SELECT Contraseña_Cliente FROM Cliente WHERE Correo_cotizante = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, correo);

            ResultSet rs = pst.executeQuery();

            // Si la consulta devuelve algún resultado
            if (rs.next()) {
                String hashedPassword = rs.getString("Contraseña_Cliente"); // Obtenemos la contraseña encriptada desde la base de datos
                // Verificamos si la contraseña proporcionada coincide con la contraseña encriptada
                resultado = PasswordHasher.checkPassword(contraseña, hashedPassword);
            }

            rs.close();
            pst.close();
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return resultado;
    }

    public cliente obtenerClientePorCorreoYContraseña(String correo, String contraseña) {
        cliente cli = null;
        String sql = "SELECT * FROM cliente WHERE Correo_cotizante = ?";
        try {
            Connection con = new conexion().conectar();
            PreparedStatement ps;
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String hashedPassword = rs.getString("Contraseña_Cliente");
                    // Verificar si la contraseña proporcionada coincide con la contraseña encriptada
                    if (PasswordHasher.checkPassword(contraseña, hashedPassword)) {
                        cli = new cliente();
                        cli.setCltId(rs.getString("idCliente"));
                        cli.setCltCorreo(rs.getString("Correo_cotizante"));
                        // Rellenar otros campos del cliente según sea necesario
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cli;
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
                cliente[6] = rs.getString("Estado_Cliente");
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

    public boolean agregar(cliente clt) {
        String sql = "CALL SP_INSERT_CLIENTE (?, ?)";
        boolean exito = false;

        try {
            String contraseña = PasswordHasher.hashPassword(clt.getCltContraseña());

            ps = con.prepareStatement(sql);
            ps.setString(1, contraseña);
            ps.setString(2, clt.getCltCorreo());

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                exito = true;
            }
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

        return exito; // Devolver el número de filas afectadas por la operación de inserción
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
    public boolean update(String correo, String nombre, String apellido, String telefono) throws SQLException {
        String sql = "UPDATE cotizante SET Nombre_Cotizante = ?, Apellido_Cotizante = ?, "
                + "Telefono_Cotizante = ? WHERE Correo_Cotizante = ? ";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, correo);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                exito = true;
            }
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            throw e; // Lanza la excepción para indicar que la actualización falló
        }
        return exito;
    }

    public boolean updateCliente(String correo, String estado) throws SQLException {
        String sql = "UPDATE cliente SET Estado_Cliente = ? WHERE Correo_Cotizante = ?";
        boolean exito = false;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            ps.setString(2, correo);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                exito = true;
            }
            ps.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar: " + e.getMessage());
            throw e; // Lanza la excepción para indicar que la actualización falló
        }
        return exito;
    }
    
    public String obtenerIdCliente (String correo) throws SQLException{
        String sql = "SELECT idCliente FROM cliente WHERE Correo_cotizante = ?";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            while (rs.next()){
                correo = rs.getString("idCliente");
            }
        } catch (SQLException e){
            e.printStackTrace();
            throw e;
        }
        return correo;
    }
    
    public List<Object[]> listarEventosCliente(String idCliente) {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT * FROM vista_evento WHERE idCliente = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idCliente);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Obtener los demás campos
                cotizante cotizante = new cotizante();
                cotizante.setCotizanteNombre(rs.getString("Nombre_Cotizante"));
                cotizante.setCotizanteApellido(rs.getString("Apellido_Cotizante"));
                cotizante.setCotizanteCorreo(rs.getString("Correo_Cotizante"));
                cotizante.setCotizanteTelefono(rs.getString("Telefono_Cotizante"));
                evento evento = new evento();
                evento.setEventoId(rs.getInt("idEvento"));
                evento.setTipoEvento(rs.getString("Tipo_evento"));
                evento.setFechaEvento(rs.getTimestamp("Fecha_evento"));
                evento.setEstadoEvento(rs.getString("Estado_evento"));
                evento.setDescripcionEvento(rs.getString("Descripcion_evento"));
                cotizacion cotizacion = new cotizacion();
                cotizacion.setCantidadPersonas(rs.getInt("Cantidad_Personas_Cotización"));

                // Crear la lista de servicios para este evento
                String[] nombresServicios = rs.getString("Nombres_Servicios").split(", ");
                String[] valoresServicios = rs.getString("Valor_Servicios").split(", ");
                String[] cantidad = rs.getString("Cantidad").split(", ");
                String[] valorUnitario = rs.getString("Valor_Unitario").split(", ");
                String[] tipoServicio = rs.getString("Tipo_Servicio").split(", ");
                String[] idServicio = rs.getString("idServicio").split(", ");
                cliente cliente = new cliente();
                cliente.setCltId(rs.getString("idCliente"));
                evento.setValorFinal(rs.getInt("Precio_Final"));

                if (nombresServicios.length == valorUnitario.length
                        && nombresServicios.length == cantidad.length
                        && nombresServicios.length == valoresServicios.length
                        && nombresServicios.length == tipoServicio.length
                        && nombresServicios.length == idServicio.length) {

                    List<Object[]> listaServicios = new ArrayList<>();

                    // Agregar cada servicio a la lista de servicios
                    for (int i = 0; i < nombresServicios.length; i++) {
                        servicio serv = new servicio();
                        serv.setServicioId(idServicio[i]);
                        serv.setServicioNombre(nombresServicios[i]);
                        serv.setServicioValor(Integer.parseInt(valorUnitario[i]));

                        eventoServicio eventoServicio = new eventoServicio();
                        eventoServicio.setCantidad(Integer.parseInt(cantidad[i]));
                        eventoServicio.setPrecioTotal(Integer.parseInt(valoresServicios[i]));
                        // Agregar más propiedades si es necesario

                        Object[] servicioArray = {
                            serv.getServicioNombre(),
                            eventoServicio.getPrecioTotal(),
                            eventoServicio.getCantidad(),
                            serv.getServicioValor(),
                            serv.getServicioId()
                        };
                        listaServicios.add(servicioArray);
                    }
                    Object[] eventoArray = {
                        cotizante.getCotizanteNombre(),
                        cotizante.getCotizanteApellido(),
                        cotizante.getCotizanteCorreo(),
                        cotizante.getCotizanteTelefono(),
                        evento.getEventoId(),
                        evento.getTipoEvento(),
                        evento.getFechaEvento(),
                        evento.getEstadoEvento(),
                        evento.getDescripcionEvento(),
                        cotizacion.getCantidadPersonas(),
                        listaServicios, // Agregar la lista de servicios al array
                        cliente.getCltId(),
                        evento.getValorFinal()
                    };
                    lista.add(eventoArray);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
            // Aquí puedes manejar la excepción de acuerdo a tus necesidades
        }
        return lista;
    }
}
