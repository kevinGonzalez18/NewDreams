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
                    <c:forEach var="Detalle" items="${detalles}">
                        <form id="formulario_evento" onsubmit="return actualizarEvento()">
                            <div class="card-details">
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
                                        <select class="form-control" id="estadoEvento" name="estadoEvento">
                                            <option value="Activo" ${Detalle[7] == 'Activo' ? 'selected' : ''}>Activo</option>
                                            <option value="Realizado" ${Detalle[7] == 'Realizado' ? 'selected' : ''}>Realizado</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-10">
                                        <label for="cvc">Descipcion del evento</label>
                                        <textarea id="descripcion-evento" name="descripcion-evento" class="form-control" rows="3">${Detalle[8]}</textarea>
                                    </div>
                                    <div class="block-heading">
                                        <h2>Servicios del evento</h2>
                                    </div><br>
                                    <c:set var="total_iterations" value="${0}" />
                                    <c:forEach var="servicio" items="${Detalle[10]}" varStatus="loop">
                                        <c:set var="total_iterations" value="${loop.count}" />
                                        <div class="row">
                                            <p class="col-2 col-md-2">Cant</p>
                                            <p class="col-6 col-md-6">Servicio</p>
                                            <p class="col-2 col-md-2">V.Total</p>
                                            <p class="col-2 col-md-2">Eliminar</p>
                                            <div class="col-2 col-md-2">
                                                <div class="form-group">
                                                    <input id="service_quantity_${loop.index}" type="text" name="service_quantity_${loop.index}" class="form-control" value="${servicio[2]}" oninput="calculateTotalDetail(${loop.index})">
                                                    <input id="service_price_${loop.index}" type="hidden" name="service_price_${loop.index}" class="form-control" value="${servicio[3]}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-6 col-md-6">
                                                <div class="form-group">
                                                    <input id="service_name_${loop.index}" type="text" name="service_name_${loop.index}" class="form-control" value="${servicio[0]}" readonly>
                                                </div>
                                            </div>
                                            <div class="col-2 col-md-2">
                                                <div class="form-group">
                                                    <input id="service_total_${loop.index}" type="text" name="service_total_${loop.index}" class="form-control" value="${servicio[1]}" readonly>
                                                </div>
                                            </div>

                                            <div class="col-2 col-md-2">                                       
                                                <form action="EventoServlet?action=eliminarServicio" method="POST" class="delete-form">
                                                    <input type="hidden" name="serviceIndex" value="${total_iterations}">
                                                    <input type="hidden" name="idEvento" value="${Detalle[4]}">
                                                    <input type="hidden" name="idServicio" value="${servicio[3]}"> <!-- Asegúrate de que este índice contiene el id del servicio -->
                                                    <input type="hidden" name="serviceName" value="${servicio[0]}">
                                                    <button type="submit" class="btn btn-danger">Eliminar</button>
                                                </form>
                                            </div>

                                        </div>
                                    </c:forEach>
                                    <input type="hidden" name="total_iterations" value="${total_iterations}" />
                                    <div class="form-group col-sm-4">
                                        <label>Valor del evento</label>
                                        <input id="valor-evento" name="valor-evento" type="number" class="form-control" value="${Detalle[12]}" readonly>
                                    </div><br><br>
                                    <div class="form-group">
                                        <div class="form-group col-sm-6">
                                            <a href="PagoServlet?menu=listaPagos&idEvento=${Detalle[4]}&idCliente=${Detalle[11]}"><button type="button" class="btn btn-primary btn-block">historial de pagos</button></a>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <a href="PrincipalServlet?menu=Eventos&accion=listar"><button type="button" class="btn btn-primary btn-block">Atras</button></a>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <button type="submit" class="btn btn-primary btn-block">Actualizar evento</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
