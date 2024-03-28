package Controlador;

import DAO.administradorDAO;
import DAO.clienteDAO;
import Modelo.administrador;
import Modelo.cliente;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

        //Asigna el resultado del metodo a la variable rol
        String rol = validarCredenciales(usuario, contraseña);

        //Si rol es distinto de nulo y si es igual a alguno de los parametros redirecciona
        if (rol != null) {
            // Establecer atributo de sesión para identificar al usuario y su rol
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("rol", rol);
            if (rol.equals("administrador")) {
                response.sendRedirect("principal.jsp"); // Redirecciona al panel del administrador
                session.setAttribute("usuario", usuario);
                session.setAttribute("rol", rol);
            } else if (rol.equals("cliente")) {
                response.sendRedirect("perfilCliente.jsp"); // Redirecciona al perfil del cliente
                session.setAttribute("usuario", usuario);
                session.setAttribute("rol", rol);
            }
        } else {
            response.sendRedirect("login.jsp?error=true"); // Redirecciona de nuevo al formulario de inicio de sesión con un mensaje de error
        }
    }

    //Obtenemos los valores de las clases
    private String validarCredenciales(String usuario, String contraseña) {

        //Se instancian las clases y se envian los parametros que recibe el metodo de la peticion en el formulario
        administrador admin = new administrador();
        admin.setAdminCorreo(usuario); // Establece el correo proporcionado por el usuario
        admin.setAdminContraseña(contraseña); // Establece la contraseña proporcionada por el usuario
        cliente cli = new cliente();
        cli.setCltCorreo(usuario);
        cli.setCltContraseña(contraseña);

        //Si el los metodos devuelven true asigna a cada uno administrador o usuario, en caso contrario devuelve null
        administradorDAO adminDAO = new administradorDAO();
        clienteDAO cliDAO = new clienteDAO();
        if (adminDAO.validarCredenciales(usuario, contraseña)) {
            return "administrador";
        } else if (cliDAO.validarCrendenciales(usuario, contraseña)) {
            return "cliente";
        } else {
            return null;
        }

    }
}
