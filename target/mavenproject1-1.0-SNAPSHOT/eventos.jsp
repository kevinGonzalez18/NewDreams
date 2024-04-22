<%-- 
    Document   : dashboard
    Created on : 10/02/2024, 6:35:56 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Dreams-Dashboard</title>
        <link rel="stylesheet" href="css/stylesdashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
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
                                <th scope="col">Numero de evento</th>
                                <th scope="col">nombres cliente</th>
                                <th scope="col">Tipo evento</th>
                                <th scope="col">Estado evento</th>
                                <th scope="col">Descripcion evento</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cotizantes" items="${cotizantes}">
                            <tr>
                                <td>${cotizantes.getCotizanteCorreo()}</td>
                                <td>${cotizantes.getCotizanteNombre()}</td>
                                <td>${cotizantes.getCotizanteApellido()}</td>
                                <td>${cotizantes.getCotizanteTelefono()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <div class="modal-body">
                            <form id="formulario-evento" action="PrincipalServlet?menu=Cotizantes" method="POST">
                                <div class="form-group">
                                    <label for="correo">Correo Cotizante:</label>
                                    <input type="email" class="form-control" id="correoClt" name="correoClt" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="contrasena">Contraseña:</label>
                                    <input type="password" class="form-control" id="contrasenaClt" name="contraseñaClt" required autocomplete="current-password">>
                                </div>
                            </form>
                        </div>
                    </table>
                </div>
            </div>
        </div>
    </body>

</html>