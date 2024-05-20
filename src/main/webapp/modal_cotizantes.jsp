<%-- 
    Document   : modal_cotizantes
    Created on : 17/04/2024, 4:56:47 p. m.
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            // Obtener el parámetro de la URL
            String correoCot = request.getParameter("correoCot");
            if (correoCot == null) {
                correoCot = "";  // Valor por defecto si no hay parámetro
            }
        %>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Registrar Cliente</h5>
                        </div>
                        <div class="card-body">
                            <form id="formulario-crear-cliente" action="PrincipalServlet?menu=Cotizantes&accion=Agregar" method="POST">
                                <div class="form-group">
                                    <label for="correo">Correo Cotizante:</label>
                                    <input type="email" class="form-control" id="correoClt" name="correoClt" value="<%= correoCot %>" readonly required>
                                </div>
                                <div class="form-group">
                                    <label for="contrasena">Contraseña:</label>
                                    <input type="text" class="form-control" id="contrasenaClt" name="contrasenaClt" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Crear cliente</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS y dependencias Popper.js y jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
