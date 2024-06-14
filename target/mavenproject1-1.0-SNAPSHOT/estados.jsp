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

    <body>
        <div class="container text-center mt-4">
            <h4 class="mb-4 fs-1">Estados</h4>
        </div>
        <div class="container mt-4">
            <!-- Pestañas -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="cotizaciones-tab" data-bs-toggle="tab" data-bs-target="#cotizaciones" type="button" role="tab" aria-controls="cotizaciones" aria-selected="true">Cotizaciones no aprobadas</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="eventos-tab" data-bs-toggle="tab" data-bs-target="#eventos" type="button" role="tab" aria-controls="eventos" aria-selected="false">Eventos realizados</button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="cotizaciones" role="tabpanel" aria-labelledby="cotizaciones-tab">
                    <div class="table-responsive mt-3">
                        <table id="cotizacionesTable" class="table table-striped table-bordered display">
                            <thead>
                                <tr>
                                    <th scope="col">Número de Cotización</th>
                                    <th scope="col">Nombres Cotizante</th>
                                    <th scope="col">Teléfono Cotizante</th>
                                    <th scope="col">Correo Cotizante</th>
                                    <th scope="col">Tipo de Cotización</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cotizacion" items="${noAprobadas}">
                                    <tr>
                                        <td>${cotizacion[0]}</td>
                                        <td>${cotizacion[1]} ${cotizacion[2]}</td>
                                        <td>${cotizacion[3]}</td>
                                        <td>${cotizacion[4]}</td>
                                        <td>${cotizacion[5]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="eventos" role="tabpanel" aria-labelledby="eventos-tab">
                    <div class="table-responsive mt-3">
                        <table id="eventosTable" class="table table-striped table-bordered display">
                            <thead>
                                <tr>
                                    <th scope="col">Número de evento</th>
                                    <th scope="col">Nombres cliente</th>
                                    <th scope="col">Tipo evento</th>
                                    <th scope="col">Estado evento</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Eventos" items="${eventoRealizados}">
                                    <tr>
                                        <td>${Eventos[0]}</td>
                                        <td>${Eventos[1]} ${Eventos[2]}</td>
                                        <td>${Eventos[3]}</td>
                                        <td>${Eventos[4]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
