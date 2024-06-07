<%-- 
    Document   : resultadoAgregar
    Created on : 29/05/2024, 1:50:49 a. m.
    Author     : feli1
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Resultados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    </head>
    <body>
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            String mensajeError = (String) request.getAttribute("mensajeError");
        %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
            <% if (mensajeExito != null) { %>
                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: '<c:out value="${mensajeExito}" />',
                    showConfirmButton: true,
                    timer: 3000,
                    didClose: () => {
                        window.location.href = "PrincipalServlet?menu=Inicio";
                    }
                });
            <% } else if (mensajeError != null) { %>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '<c:out value="${mensajeError}" />',
                    showConfirmButton: true,
                    timer: 3000,
                    didClose: () => {
                        window.location.href = "PrincipalServlet?menu=Inicio";
                    }
                });
            <% }%>
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    </body>
</html>