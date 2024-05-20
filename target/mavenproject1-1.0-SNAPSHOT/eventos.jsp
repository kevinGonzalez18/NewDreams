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
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="body-pd">
        <!--Container Main start-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <table id="Table" class="table display">
                        <thead>
                            <tr>
                                <th scope="col">Numero de evento</th>
                                <th scope="col">nombres cliente</th>
                                <th scope="col">Tipo evento</th>
                                <th scope="col">Estado evento</th>
                                <th scope="col">Descripcion evento</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Eventos" items="${evento}">
                                <tr>
                                    <td>${Eventos[0]}</td>
                                    <td>${Eventos[1]} ${Eventos[2]}</td>
                                    <td>${Eventos[3]}</td>
                                    <td>${Eventos[4]}</td>
                                    <td><a href="EventoServlet?menu=detalleEvento&idEvento=${Eventos[0]}"><button>detalle</button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>

</html>