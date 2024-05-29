<%-- 
    Document   : detalleCotizacion
    Created on : 15/05/2024, 2:34:31 p. m.
    Author     : feli1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>New Dreams</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Flatpickr CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/detallesCotizacion.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    </head>
    <body>
        <div>
            <main class="page payment-page">
                <section class="payment-form dark">
                    <div class="container">
                        <div class="block-heading">
                            <h2>Detalles de la Cotización</h2>
                        </div><br>
                        <form action="CotizacionServlet" method="POST">
                            <div class="card-details">
                                <c:forEach var="cotizacion" items="${cotizacion}">
                                    <h3 class="title" style="color: black;">Id de la cotizacion: ${cotizacion[0]}</h3><br>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Nombre del cliente</label>
                                            <input id="nombreCotizacion" name="nombreCotizacion" type="text" class="form-control" value="${cotizacion[1]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div><br>
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Apellido del cliente</label>
                                            <input id="apellidoCotizacion" name="apellidoCotizacion" type="text" class="form-control" value="${cotizacion[2]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Correo del cliente</label>
                                            <input id="correoCotizacion" name="correoCotizacion" type="text" class="form-control" value="${cotizacion[3]}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                        </div><br>
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Telefono del cliente</label>
                                            <input id="telefonoCotizacion" name="telefonoCotizacion" type="text" class="form-control" value="${cotizacion[4]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="card-number">Tipo de evento</label>
                                            <input id="tipoCotizacion" name="tipoCotizacion" type="text" class="form-control" value="${cotizacion[5]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="cvc">Cantidad de personas</label>
                                            <input id="cantidadCotizacion" name="cantidadCotizacion" type="text" class="form-control" value="${cotizacion[6]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Fecha de la cotizacion</label>
                                            <div class="input-group expiration-date">
                                                <input id="fechaCotizacion" name="fechaCotizacion" type="text" class="form-control" value="${cotizacion[7]}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="form-group">
                                                <label for="toggle_date">Fecha y hora del evento</label>
                                                <i id="toggle_date_icon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
                                                <input id="fechaEvento" type="text" name="fechaEvento" class="form-control" required="required" value="${cotizacion[8]}">
                                                <div id="date_container" style="display: none;"></div>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Ubicacion</label>
                                            <div class="input-group expiration-date">
                                                <input id="ubicacionCotizacion" name="ubicacionCotizacion" type="text" class="form-control" value="${cotizacion[9]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Valor</label>
                                            <div class="input-group expiration-date">
                                                <input id="valorCotizacion" name="valorCotizacion" type="text" class="form-control" value="${cotizacion[10]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <!-- Iterar sobre los servicios dentro de la cotizacion -->
                                        <div class="col-12 mx-auto">
                                            <div class="container">
                                                <div class="card mt-2 mx-auto bg-light">
                                                    <div class="card-body bg-light">
                                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                                            <h4 class="mb-0">Servicios:</h4>
                                                            <button type="button" class="btn btn-success" onclick="openModal('${cotizacion[0]}')">Agregar Servicio</button>
                                                        </div>
                                                        <c:set var="total_iterations" value="${0}" />
                                                        <c:forEach var="servicio" items="${cotizacion[11]}" varStatus="loop">
                                                            <c:set var="total_iterations" value="${loop.count}" />
                                                            <div class="row mb-2 service-item">
                                                                <div class="col-1">
                                                                    <p class="form-label">Cant</p>
                                                                    <div class="form-group">
                                                                        <input id="service_quantity_${loop.index}" type="text" name="service_quantity_${loop.index}" class="form-control" required="required" value="${servicio[3]}" oninput="calculateTotalDetail(${loop.index})">
                                                                    </div>
                                                                </div>
                                                                <div class="col-4">
                                                                    <p class="form-label">Servicio Tipo: ${servicio[2]}</p>
                                                                    <div class="form-group">
                                                                        <input id="service_name_${loop.index}" type="text" name="service_name_${loop.index}" class="form-control" value="${servicio[0]}" readonly>
                                                                    </div>
                                                                </div>
                                                                <div class="col-3">
                                                                    <p class="form-label">V.Unitario</p>
                                                                    <div class="form-group">
                                                                        <input id="service_price_${loop.index}" type="text" name="service_price_${loop.index}" class="form-control" value="${servicio[1]}" readonly>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <p class="form-label">V.Total</p>
                                                                    <div class="form-group">
                                                                        <input id="service_total_price_${loop.index}" type="text" name="service_total_price_${loop.index}" class="form-control" value="${servicio[4]}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <br>
                                                                    <div class="form-group">
                                                                        <form action="CotizacionServlet?action=deleteService" method="POST" class="delete-form">
                                                                            <input type="hidden" name="serviceIndex" value="${total_iterations}">
                                                                            <input type="hidden" name="idCotizacion" value="${cotizacion[0]}">
                                                                            <input type="hidden" name="serviceName" value="${servicio[0]}">
                                                                            <button type="submit" class="delete-service-btn">
                                                                                <i class="fa-solid fa-trash"></i>
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <input type="hidden" name="total_iterations" value="${total_iterations}" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group col-12 d-flex justify-content-end">
                                            <div class="btn-group">
                                                <input type="submit" name="action" value="updateCotizacion" placeholder="Actualizar cotizacion" class="btn btn-primary">
                                                <a href="#"><button type="button" class="btn btn-primary">Crear evento</button></a>
                                                <a href="PrincipalServlet?menu=Cotizaciones&accion=listar"><button type="button" class="btn btn-primary">Atrás</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </form>
                    </div>
                </section>
            </main>
        </div>
        <!-- Modal Structure -->
        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Agregar Servicio</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" id="searchInput" onkeyup="filterServices()" class="form-control mb-3" placeholder="Buscar servicios...">
                        <div id="servicesList" class="list-group">
                            <!-- Aquí se cargará el contenido de los servicios -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" onclick="addSelectedServices()">Agregar Servicios</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Flatpickr JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    </body>
</html>
