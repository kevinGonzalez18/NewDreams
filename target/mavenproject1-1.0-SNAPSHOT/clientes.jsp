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
                                <th scope="col">Codigo Cliente</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Contraseña</th>
                                <th scope="col">Editar</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cliente" items="${clientes}">
                                <tr>
                                    <td>${cliente[4]}</td>
                                    <td>
                                        <select class="estado-cliente" id="estadoCliente" name="estadoCliente">
                                            <option value="Habilitado" ${cliente[6] == 'Habilitado' ? 'selected' : ''} data-correo="${cliente[0]}">Habilitado</option>
                                            <option value="Inhabilitado" ${cliente[6] == 'Inhabilitado' ? 'selected' : ''} data-correo="${cliente[0]}">Inhabilitado</option>
                                        </select>
                                    </td>
                                    <td name="correo">${cliente[0]}</td>
                                    <td>${cliente[1]}</td>
                                    <td>${cliente[2]}</td>
                                    <td>${cliente[3]}</td>
                                    <td>${cliente[5]}</td>
                                    <td><i class="fa-solid fa-user-plus crear-cliente-btn" style="cursor: pointer;"></i></td>
                                    <td><i class="fa-solid fa-trash"></i></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.estado-cliente').change(function () {
                    var estado = $(this).val();
                    var correo = $(this).find('option:selected').data('correo');
                    $.ajax({
                        type: "POST",
                        url: "PrincipalServlet?menu=Clientes&accion=actualizarEstado",
                        data: {estadoCliente: estado, correo: correo, accion: "actualizarEstado"},
                        success: function (data) {
                            // Manejar la respuesta del servidor si es necesario
                            console.log(data);
                        }
                    });
                });
            });
        </script>
    </body>
</html>