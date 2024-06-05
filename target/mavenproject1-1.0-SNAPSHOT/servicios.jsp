
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
        <!-- Título Principal -->
        <div class="container text-center mt-4">
            <h4 class="mb-4 fs-1">Servicios</h4>
        </div>

        <!-- Container Main start -->
        <div class="container">
            <div class="d-flex justify-content-end align-items-center mb-2">
                <button type="button" class="btn btn-success" onclick="openModal()">Agregar Servicios</button>
            </div>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <table id="Table" class="table display">
                            <thead>
                                <tr>
                                    <th scope="col">Id del servicio</th>
                                    <th scope="col">Nombres servicio</th>
                                    <th scope="col">Valor servicio</th>
                                    <th scope="col">Tipo servicio</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="servicio" items="${listaServicios}">
                                    <tr>
                                        <td>${servicio.getServicioId()}</td>
                                        <td>${servicio.getServicioNombre()}</td>
                                        <td>${servicio.getServicioValor()}</td>
                                        <td>${servicio.getServicioTipo()}</td>
                                        <td>
                                            <a href="CotizacionServlet?menu=detalleCotizacion&idCotizacion=${cotizacion[0]}" target="target"><button class="btn btn-primary">Ver más</button></a>
                                            <a href="PrincipalServlet?menu=Servicios&accion=eliminar&idServicio=${servicio.getServicioId()}" target="target"><button class="btn btn-danger">Eliminar</button></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Agregar Servicio</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="PrincipalServlet?menu=Servicios&accion=agregar" method="POST">
                        <div class="modal-body">
                            <input type="text" id="nombreServicio" name="nombreServicio" class="form-control mb-3" placeholder="Nombre Servicio">
                            <input type="text" id="valorServicio" name="valorServicio" class="form-control mb-3" placeholder="Valor Servicio">
                            <select id="tipoServicio" name="tipoServicio" class="form-control">
                                <option value="" selected disabled>Seleccionar</option>
                                <option value="Manteleria">Manteleria</option>
                                <option value="Mesas y sillas">Mesas y sillas</option>
                                <option value="Decoracion">Decoracion</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button></a>
                            <button type="submit" class="btn btn-primary" >Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
