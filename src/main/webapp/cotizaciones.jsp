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
                                <th scope="col">Numero de Cotización</th>
                                <th scope="col">Nombres Cotizante</th>
                                <th scope="col">Telefono Cotizante</th>
                                <th scope="col">Correo Cotizante</th>
                                <th scope="col">Tipo de Cotización</th>
                                <th scope="col">Descripción de Cotización</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cotizacion" items="${cotizaciones}">
                                <tr>
                                    <td>${cotizacion[0]}</td>
                                    <td>${cotizacion[1]} ${cotizacion[2]}</td>
                                    <td>${cotizacion[3]}</td>
                                    <td>${cotizacion[4]}</td>
                                    <td>${cotizacion[5]}</td>
                                    <td><a href="CotizacionServlet?menu=detalleCotizacion&idCotizacion=${cotizacion[0]}" target="target"><button>Ver más</button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>

</html>