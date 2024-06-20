<%-- 
    Document   : dashboard
    Created on : 10/02/2024, 6:35:56 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
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
        <div class="container text-center mt-4">
            <h4 class="mb-4 fs-1">Cotizantes</h4>
        </div>

        <!--Container Main start-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <table id="Table" class="table display">
                        <thead>
                            <tr>
                                <th scope="col">Correo Cotizante</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cotizantes" items="${cotizantes}">
                                <tr>
                                    <td>${cotizantes.getCotizanteCorreo()}</td>
                                    <td>${cotizantes.getCotizanteNombre()}</td>
                                    <td>${cotizantes.getCotizanteApellido()}</td>
                                    <td>${cotizantes.getCotizanteTelefono()}</td>
                                    <td>
                                        <button class="btn btn-primary" onclick="abrirModalCotizante('${cotizantes.getCotizanteCorreo()}')">Crear cliente</button>
                                        <button class="btn btn-danger" onclick="eliminarCotizante('${cotizantes.getCotizanteCorreo()}')">Eliminar</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Crear cotizante</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="formulario-cotizante" onsubmit="return crearCotizante();">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="correo">Correo Cotizante:</label>
                                <input type="text" class="form-control" id="correoClt" name="correoClt" readonly required>
                            </div>
                            <div class="form-group">
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" class="form-control" id="contrasenaClt" name="contrasenaClt" readonly required>
                                <button type="button" class="btn btn-secondary" onclick="generarContrasena()">Generar Contraseña</button>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Crear</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
