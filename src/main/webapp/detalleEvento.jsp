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
                            <h3 class="title">Id del evento</h3><br>
                            <div class="row">
                                <c:forEach var="Detalle" items="${detallesEvento}">
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Nombre del cliente</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[0]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div><br>
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Apellido del cliente</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[1]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Correo del cliente</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[2]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div><br>
                                    <div class="form-group col-sm-6">
                                        <label for="card-holder">Telefono del cliente</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[3]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="form-group col-sm-8">
                                        <label for="card-number">Tipo de evento</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[5]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label for="cvc">Cantidad de personas</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[10]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div>
                                    <!-- comment <div class="form-group col-sm-8">
                                        <label for="">Fecha del evento</label>
                                        <div class="input-group expiration-date">
                                            <input type="text" class="form-control" placeholder="YY" aria-label="YY" aria-describedby="basic-addon1">
                                            <span class="date-separator">/</span>
                                            <input type="text" class="form-control" placeholder="MM" aria-label="MM" aria-describedby="basic-addon1">
                                            <span class="date-separator">/</span>
                                            <input type="text" class="form-control" placeholder="DD" aria-label="DD" aria-describedby="basic-addon1">
                                            <span class="date-separator">/</span>
                                            <input type="text" class="form-control" placeholder="Hora" aria-label="Hora" aria-describedby="basic-addon1">
                                        </div>
                                    </div>-->
                                    <div class="form-group col-sm-4">
                                        <label for="cvc">Estado del evento</label>
                                        <input id="cvc" type="text" class="form-control" value="${Detalle[7]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="cvc">Descipcion del evento</label>
                                        <input id="card-holder" type="text" class="form-control" value="${Detalle[9]}" aria-label="Card Holder" aria-describedby="basic-addon1">
                                    </div>
                                </c:forEach>

                                <div class="block-heading">
                                    <h2>Servicios del evento</h2>
                                </div><br>
                                <div class="row">
                                    <p class="col-2 col-md-2">Cant</p>
                                    <p class="col-4 col-md-4">Servicio</p>
                                    <p class="col-3 col-md-3">V.Unitario</p>
                                    <p class="col-3 col-md-3">V.Total</p>
                                    <div class="col-2 col-md-2">
                                        <div class="form-group">
                                            <input id="service_quantity_manteleria_${loop.index}" type="text" name="service_quantity_${loop.index}" class="form-control" placeholder="0" required="required" oninput="calculateTotal(${loop.index}, 'manteleria')" value="0" onkeydown="preventDeletingZero(event)" onkeypress="return onlyNumberKey(event)">
                                        </div>
                                    </div>
                                    <div class="col-4 col-md-4">
                                        <div class="form-group">
                                            <input id="service_name_manteleria_${loop.index}" type="text" name="service_name_${loop.index}" class="form-control" placeholder="Nombre del servicio" value="${manteleria.getServicioNombre()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-3 col-md-3">
                                        <div class="form-group">
                                            <input id="service_price_manteleria_${loop.index}" type="text" name="service_price_${loop.index}" class="form-control" placeholder="0" value="${manteleria.getServicioValor()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-3 col-md-3">
                                        <div class="form-group">
                                            <input id="service_total_price_manteleria_${loop.index}" type="number" name="service_total_price_${loop.index}" class="form-control" placeholder="Precio total calculado" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-4">
                                    <a href="historialPagosCliente.jsp"><button type="button" class="btn btn-primary btn-block">historial de pagos</button></a>
                                </div>
                                <div class="form-group col-sm-4">
                                    <a href="PrincipalServlet?menu=Eventos&accion=listar"><button type="button" class="btn btn-primary btn-block">Atras</button></a>
                                </div>
                            </div>
                    </form>
                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
