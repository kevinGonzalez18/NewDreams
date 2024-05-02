package Controlador;

import DAO.eventoDAO;
import Modelo.evento;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventoServlet extends HttpServlet {

    // Instanciar el DAO para acceder a los detalles del evento
    eventoDAO eventoDAO = new eventoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion2 = request.getParameter("accion2");
        if (menu != null && menu.equals("idEvento")) {
            // Obtener el ID del evento de la solicitud HTTP
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            // Obtener los detalles del evento del DAO
            List<Object[]> detallesEvento = eventoDAO.DetallesEvento(idEvento);
            // Pasar el objeto evento al formulario JSP
            request.setAttribute("detallesEvento", detallesEvento);
            request.getRequestDispatcher("detalleEvento.jsp").include(request, response);

            List<Object[]> detalles = (List<Object[]>) request.getAttribute("detallesEvento");
            if (detallesEvento != null) {
                request.setAttribute("Nombre_Cotizante", detallesEvento.get(0)[0]);
                request.setAttribute("Apellido_Cotizante", detallesEvento.get(0)[1]);
                request.setAttribute("Correo_Cotizante", detallesEvento.get(0)[2]);
                request.setAttribute("Telefono_Cotizante", detallesEvento.get(0)[3]);
                request.setAttribute("Tipo_evento", detallesEvento.get(0)[4]);
                request.setAttribute("Fecha_Evento", detallesEvento.get(0)[5]);
                request.setAttribute("Estado_Evento", detallesEvento.get(0)[6]);
                request.setAttribute("Tematica_evento", detallesEvento.get(0)[7]);
                request.setAttribute("Descripcion_evento", detallesEvento.get(0)[8]);
                request.setAttribute("Cantidad_Personas_Cotización", detallesEvento.get(0)[9]);
            }else {
            // Handle the case where menu is null or has an unexpected value
            }
        }
// Agrega los demás atributos que desees mostrar en los campos de entrada
            // Redirigir a la página de detalles del evento
        }

        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }
    }
