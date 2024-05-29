<%-- 
    Document   : detalleEvento
    Created on : 24/04/2024, 3:08:03 p. m.
    Author     : APRENDIZ
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Modelo.evento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <main class="page payment-page">
            <section class="payment-form dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Detalles del evento</h2>
                    </div><br>
                    <form>
                        <div class="card-details">
                            <c:forEach var="Detalle" items="${detalles}">
                                <h3 class="title">Id del evento: ${Detalle[4]}</h3><br>
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Nombre del cliente</label>
                                        <input id="nombre-cliente" type="text" class="form-control" value="${Detalle[0]}" readonly>
                                        <input type="hidden" id="idCliente" name="idCliente" value="${Detalle[11]}">
                                    </div><br>
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Apellido del cliente</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[1]}" readonly>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Correo del cliente</label>
                                        <input id="correo-cliente" type="text" class="form-control" value="${Detalle[2]}" readonly>
                                    </div><br>
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Telefono del cliente</label>
                                        <input id="telefono-cliente" type="text" class="form-control" value="${Detalle[3]}" readonly>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="card-number">Tipo de evento</label>
                                        <input id="tipo-evento" type="text" class="form-control" value="${Detalle[5]}" readonly>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="cvc">Cantidad de personas</label>
                                        <input id="cantidad-personas" type="text" class="form-control" value="${Detalle[9]}" readonly>
                                    </div>
                                    <div class="form-group col-sm-2">
                                        <label for="cvc">Estado del evento</label>
                                        <input id="estado-evento" type="text" class="form-control" value="${Detalle[7]}" readonly>
                                    </div>
                                    <div class="form-group col-sm-10">
                                        <label for="cvc">Descipcion del evento</label>
                                        <input id="descripcion-evento" type="text" class="form-control" value="${Detalle[8]}" readonly>
                                    </div>
                                    <div class="block-heading">
                                        <h2>Servicios del evento</h2>
                                    </div><br>
                                    <c:forEach var="servicio" items="${Detalle[10]}">

                                        <div class="row">
                                            <p class="col-2 col-md-2">Cant</p>
                                            <p class="col-8 col-md-8">Servicio</p>
                                            <p class="col-2 col-md-2">V.Total</p>
                                            <div class="col-2 col-md-2">
                                                <div class="form-group">
                                                    <input id="service_name_manteleria_${loop.index}" type="number" name="service_name_${loop.index}" class="form-control" value="${servicio[2]}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-8 col-md-8">
                                                <div class="form-group">
                                                    <input id="service_total_price_manteleria_${loop.index}" type="text" name="service_total_price_${loop.index}" class="form-control" value="${servicio[0]}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-2 col-md-2">
                                                <div class="form-group">
                                                    <input id="service_total_price_manteleria_${loop.index}" type="number" name="service_total_price_${loop.index}" class="form-control" value="${servicio[1]}" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="form-group col-sm-4">
                                        <a href="PagoServlet?menu=listaPagos&idEvento=${Detalle[4]}&idCliente=${Detalle[11]}"><button type="button" class="btn btn-primary btn-block">historial de pagos</button></a>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <a href="PrincipalServlet?menu=Eventos&accion=listar"><button type="button" class="btn btn-primary btn-block">Atras</button></a>
                                    </div>
                                </div>
                            </c:forEach>
                    </form>
                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
