package Controlador;

import DAO.administradorDAO;
import DAO.clienteDAO;
import Modelo.administrador;
import Modelo.cliente;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Obtiene los datos del formulario y los asigna a las variables
        String usuario = request.getParameter("userName");
        String contraseña = request.getParameter("password");

        // Obtener el rol y el ID del administrador
        Object[] resultado = validarCredenciales(usuario, contraseña);
        String rol = (String) resultado[0];
        Object user = resultado[1];

        //Si rol es distinto de nulo y si es igual a alguno de los parametros redirecciona
        if (rol != null) {
            // Establecer atributo de sesión para identificar al usuario y su rol
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", rol);
            if (rol.equals("administrador")) {
                administrador admin = (administrador) user;
                if (admin != null) {
                    session.setAttribute("adminId", admin.getAdminId());
                }
            } else if (rol.equals("cliente")) {
                cliente cli = (cliente) user;
                if (cli != null) {
                    String clienteId = cli.getCltId();
                    session.setAttribute("clienteId", clienteId);
                    System.out.println("Cliente ID set in session: " + clienteId); // Depuración
                }
            }
            String sessionId = UUID.randomUUID().toString();
            session.setAttribute("sessionId", sessionId);
            if (rol.equals("administrador")) {
                response.sendRedirect("principal.jsp"); // Redirecciona al panel del administrador
            } else if (rol.equals("cliente")) {
                response.sendRedirect("perfilCliente.jsp"); // Redirecciona al perfil del cliente
            } else {
                response.sendRedirect("login.jsp?error=inhabilitado");
            }
        } else {
            response.sendRedirect("login.jsp?error=true"); // Redirecciona de nuevo al formulario de inicio de sesión con un mensaje de error
        }
    }

    //Obtenemos los valores de las clases
    private Object[] validarCredenciales(String usuario, String contraseña) {
        administradorDAO adminDAO = new administradorDAO();
        clienteDAO cliDAO = new clienteDAO();

        // Verificar credenciales del administrador
        administrador admin = adminDAO.obtenerAdminPorCorreoYContraseña(usuario, contraseña);
        if (admin != null) {
            return new Object[]{"administrador", admin};
        }

        // Verificar credenciales del cliente
        cliente cli = cliDAO.obtenerClientePorCorreoYContraseña(usuario, contraseña);
        if (cli != null) {
            String estadoCliente = cliDAO.obtenerEstadoCliente(usuario);
            if ("Habilitado".equals(estadoCliente)) {
                return new Object[]{"cliente", cli};
            }
        }

        return new Object[]{null, null};
    }
}
