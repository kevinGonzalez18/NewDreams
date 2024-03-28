<%-- 
    Document   : dashboard
    Created on : 10/02/2024, 6:35:56 p. m.
    Author     : Felipe Rodriguez
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
        <!--Container Main start-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Correo Cotizante</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Crear cliente</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cotizantes" items="${cotizantes}">
                                <tr>
                                    <td>${cotizantes.getCotizanteCorreo()}</td>
                                    <td>${cotizantes.getCotizanteNombre()}</td>
                                    <td>${cotizantes.getCotizanteApellido()}</td>
                                    <td>${cotizantes.getCotizanteTelefono()}</td>
                                    <td><i class="fa-solid fa-user-plus crear-cliente-btn" style="cursor: pointer;" data-correo="${cotizantes.getCotizanteCorreo()}"></i></td>
                                    <td><i class="fa-solid fa-trash"></i></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
    </body>
            </div>
        </div>
    </body>
    <div id="formulario-crear" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Crear Cliente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="formulario-crear-cliente" action="PrincipalServlet?menu=Cotizantes" method="POST">
                        <div class="form-group">
                            <label for="correo">Correo Cotizante:</label>
                            <input type="email" class="form-control" id="correoClt" name="correoClt" readonly>
                        </div>
                        <div class="form-group">
                            <label for="contrasena">Contraseña:</label>
                            <input type="password" class="form-control" id="contrasenaClt" name="contraseñaClt" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn-guardar">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('.crear-cliente-btn').click(function () {
                var correoCotizante = $(this).data('correo');
                $('#correoClt').val(correoCotizante);
                $('#formulario-crear').modal('show');
            });

            $(document).ready(function () {
                $('#btn-guardar').click(function () {
                    var correo = $('#correoClt').val();
                    var contraseña = $('#contrasenaClt').val();
                    window.location.href = "PrincipalServlet?menu=Cotizantes&accion=Agregar&correoClt=" + correo + "&contraseñaClt=" + contraseña;
                });
            });
        });
    </script>
</html>