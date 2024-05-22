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
                        <form>
                            <div class="card-details">
                                <c:forEach var="cotizacion" items="${cotizacion}">
                                    <h3 class="title">Id del evento: ${cotizacion[0]}</h3><br>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Nombre del cliente</label>
                                            <input id="card-holder" type="text" class="form-control" value="${cotizacion[1]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div><br>
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Apellido del cliente</label>
                                            <input id="card-holder" type="text" class="form-control" value="${cotizacion[2]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Correo del cliente</label>
                                            <input id="card-holder" type="text" class="form-control" value="${cotizacion[3]}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                        </div><br>
                                        <div class="form-group col-sm-6">
                                            <label for="card-holder">Telefono del cliente</label>
                                            <input id="card-holder" type="text" class="form-control" value="${cotizacion[4]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="card-number">Tipo de evento</label>
                                            <input id="card-holder" type="text" class="form-control" value="${cotizacion[5]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="cvc">Cantidad de personas</label>
                                            <input id="card-holder" type="text" class="form-control" value="${cotizacion[6]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Fecha de la cotizacion</label>
                                            <div class="input-group expiration-date">
                                                <input id="card-holder" type="text" class="form-control" value="${cotizacion[7]}" aria-label="Card Holder" aria-describedby="basic-addon1" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Fecha parcial del evento</label>
                                            <div class="input-group expiration-date">
                                                <input id="card-holder" type="date" class="form-control" value="${cotizacion[8]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Ubicacion</label>
                                            <div class="input-group expiration-date">
                                                <input id="card-holder" type="text" class="form-control" value="${cotizacion[9]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="">Valor</label>
                                            <div class="input-group expiration-date">
                                                <input id="card-holder" type="text" class="form-control" value="${cotizacion[10]}" aria-label="Card Holder" aria-describedby="basic-addon1">
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
                                                        <c:forEach var="servicio" items="${cotizacion[11]}">
                                                            <div class="row mb-2 service-item">
                                                                <div class="col-2">
                                                                    <p class="form-label">Cant</p>
                                                                    <div class="form-group">
                                                                        <input id="service_quantity_manteleria_${loop.index}" type="text" name="service_quantity_manteleria_${loop.index}" class="form-control" required="required" value="${servicio[3]}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-4">
                                                                    <p class="form-label">Servicio Tipo: ${servicio[2]}</p>
                                                                    <div class="form-group">
                                                                        <input id="service_name_manteleria_${loop.index}" type="text" name="service_name_manteleria_${loop.index}" class="form-control" value="${servicio[0]}" readonly>
                                                                    </div>
                                                                </div>
                                                                <div class="col-3">
                                                                    <p class="form-label">V.Unitario</p>
                                                                    <div class="form-group">
                                                                        <input id="service_price_manteleria_${loop.index}" type="text" name="service_price_manteleria_${loop.index}" class="form-control" value="${servicio[1]}" readonly>
                                                                    </div>
                                                                </div>
                                                                <div class="col-3">
                                                                    <p class="form-label">V.Total</p>
                                                                    <div class="form-group">
                                                                        <input id="service_total_price_manteleria_${loop.index}" type="number" name="service_total_price_manteleria_${loop.index}" class="form-control" value="${servicio[4]}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group col-12 d-flex justify-content-end">
                                            <div class="btn-group">
                                                <a href="#"><button type="button" class="btn btn-primary">Actualizar cotización</button></a>
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
    </body>
</html>
