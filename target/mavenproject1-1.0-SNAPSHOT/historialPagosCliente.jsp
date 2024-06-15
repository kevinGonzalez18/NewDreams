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
                            <input type="hidden" class="form-control" value="${Pago[6]}" readonly>
                            <input type="hidden" class="form-control" value="${Pago[7]}" readonly>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <br><br>
                <div class="form-group col-lg-6 col-md-6">
                    <a href="PerfilClienteServlet?menu=historialEventos"><button type="button" class="btn btn-primary btn-block">Atras</button></a>
                </div>
            </div>
        </div>

        <!-- JavaScript de Bootstrap (requiere jQuery) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>