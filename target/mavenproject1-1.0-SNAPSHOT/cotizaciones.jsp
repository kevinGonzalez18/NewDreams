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
                                <th scope="col">Tipo de Evento</th>
                                <th scope="col">Ver Detalle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cotizacion" items="${cotizaciones}">
                                <tr>
                                    <td>${cotizacion[7]}</td>
                                    <td>${cotizacion[1]}</td>
                                    <td>
                                        <!-- Botón para mostrar el detalle -->
                                        <button class="ver-detalle-btn">Ver Detalle</button>
                                        <!-- Detalle desplegable oculto por defecto -->
                                        <div class = "container detalle">
                                            <form id="contact-form" role="form">
                                                <div class="controls">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="form_name">Tipo de evento</label>
                                                                <input type="text" value="${cotizacion[1]}">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="event_location">Lugar del evento</label>
                                                                <input value="${cotizacion[2]}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="form_email">Cantidad de personas</label>
                                                                <input value="${cotizacion[6]}">                                                        </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="toggle_date">Fecha del evento</label>
                                                                <input value="${cotizacion[3]}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h1>Servicios</h1>
                                                    <div class="row">
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <label for="service_quantity">Cantidad</label>
                                                                    <input id="service_quantity" type="text" name="service_quantity" class="form-control" placeholder="0" required="required">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <label for="service_name">Nombre del servicio</label>
                                                                    <input id="service_quantity" type="text" name="service_quantity" class="form-control" placeholder="0" required="required" value="${servicio.getServicioTipo()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="service_unit_price">Precio unitario</label>
                                                                    <input id="service_quantity" type="text" name="service_quantity" class="form-control" placeholder="0" required="required" value="${servicio.getServicioValor()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <label for="service_total_price">Precio total</label>
                                                                    <input type="number" class="form-control" placeholder="Precio total calculado" readonly>
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            // Script para manejar el clic en el botón "Ver Detalle"
            document.querySelectorAll('.ver-detalle-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    // Obtener el elemento padre de este botón (fila de la tabla)
                    const fila = this.closest('tr');
                    // Buscar el detalle asociado a esta fila
                    const detalle = fila.querySelector('.detalle');
                    // Cambiar el estado de visualización del detalle
                    detalle.style.display = detalle.style.display === 'none' ? 'table-row' : 'none';
                });
            });
        </script>
    </body>

</html>