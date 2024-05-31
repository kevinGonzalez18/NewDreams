<%-- 
    Document   : updateClientes
    Created on : 19/04/2024, 3:26:46 p. m.
    Author     : feli1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Dreams-Dashboard</title>
        <link rel="stylesheet" href="css/stylesdashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="body-pd">
        <div class="container">
            <h2>Formulario Simple</h2>
            <form action="ClienteServlet?accion2=update" method="POST">
                <c:forEach var="datos" items="${datos}">
                    <p>El id del cliente es: ${datos[4]}</p>
                    <div class="form-group">
                        <label for="nombre">Nombres:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="${datos[1]}">
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellidos:</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" value="${datos[2]}">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="${datos[0]}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="phone">Telefono:</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${datos[3]}">
                    </div>
                    <select class="estado-cliente" id="estadoCliente" name="estadoCliente">
                        <option value="Habilitado" ${datos[6] == 'Habilitado' ? 'selected' : ''}>Habilitado</option>
                        <option value="Inhabilitado" ${datos[6] == 'Inhabilitado' ? 'selected' : ''}>Inhabilitado</option>
                    </select>
                </c:forEach>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>
