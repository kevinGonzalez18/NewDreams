<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS de Bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body id="body-pd">
        <!--Container Main start-->
        <div class="block-heading">
            <h2>Pagos</h2>
        </div><br>
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <table id="Table" class="table display">
                        <thead>
                            <tr>
                                <th scope="col">Numero de pago</th>
                                <th scope="col">Nombres cliente</th>
                                <th scope="col">Apellidos cliente</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Valor</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Pago" items="${Pagos}">
                                <tr>
                                    <td>${Pago[1]}</td>
                                    <td>${Pago[2]}</td>
                                    <td>${Pago[3]}</td>
                                    <td>${Pago[4]}</td>
                                    <td>${Pago[5]}</td>
                                </tr>

                            </c:forEach>
                            <c:forEach var="Pago" items="${Pagos}">
                            <input id="card-holder" type="hidden" class="form-control" value="${Pago[6]}" readonly>
                            <input id="card-holder" type="hidden" class="form-control" value="${Pago[7]}" readonly>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <br><br>
                <div class="form-group col-lg-6 col-md-6">
                    <button type="button" class="btn btn-primary btn-block" onclick="abrirModal()">Registrar comprobante</button>
                </div>
                <div class="form-group col-lg-6 col-md-6">
                    <a href="PrincipalServlet?menu=Eventos&accion=listar"><button type="button" class="btn btn-primary btn-block">Atras</button></a>
                </div>
            </div>
        </div>

        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Agregar pago</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="paymentForm" action="PagoServlet" method="POST">
                            <input type="text" id="nombre" name="nombre" class="form-control mb-3" placeholder="Nombre">
                            <input type="text" id="apellido" name="apellido" class="form-control mb-3" placeholder="Apellido">
                            <input type="date" id="fecha" name="fecha" class="form-control mb-3" placeholder="Fecha">
                            <input type="number" id="valor" name="valor" class="form-control mb-3" placeholder="Valor">
                            <input type="hidden" id="idEvento" name="idEvento" class="form-control mb-3" value="${param.idEvento}">
                            <input type="hidden" id="idCliente" name="idCliente" class="form-control mb-3" value="${param.idCliente}">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" form="paymentForm" class="btn btn-primary">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- JavaScript de Bootstrap (requiere jQuery) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>