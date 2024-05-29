package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Eliminar la sesión
        }
         // Agregar encabezados para evitar caching
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Expires", "Thu, 01 Jan 1970 00:00:00 GMT");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
