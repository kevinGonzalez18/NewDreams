<%-- 
    Document   : resultadoAgregar
    Created on : 29/05/2024, 1:50:49 a. m.
    Author     : feli1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Resultado de Agregar Servicio</title>
    </head>
    <body>
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            String mensajeError = (String) request.getAttribute("mensajeError");

            if (mensajeExito != null) {
        %>
        <script>
            alert("<%= mensajeExito%>");
            window.location.href = "PrincipalServlet?menu=Inicio"; // Redirigir a la página principal o a la lista de servicios
        </script>
        <%
        } else if (mensajeError != null) {
        %>
        <script>
            alert("<%= mensajeError%>");
            window.location.href = "PrincipalServlet?menu=Inicio"; // Redirigir a la página principal o a la lista de servicios
        </script>
        <%
            }
        %>
    </body>
</html>
