
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

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
    <%
        String mensajeExito = (String) request.getAttribute("mensajeExito");
        String mensajeError = (String) request.getAttribute("mensajeError");
    %>
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
                                            <button class="btn btn-primary" onclick="abrirModal2('${servicio.getServicioId()}', '${servicio.getServicioNombre()}', '${servicio.getServicioValor()}', '${servicio.getServicioTipo()}')">Actualizar</button>
                                            <button class="btn btn-danger" onclick="eliminarServicio('${servicio.getServicioId()}')">Eliminar</button>
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
                    <form id="formulario-servicio" onsubmit="return agregarServicio();">
                        <div class="modal-body">
                            <input type="text" id="nombreServicio" name="nombreServicio" class="form-control mb-3" placeholder="Nombre Servicio" required>
                            <input type="text" id="valorServicio" name="valorServicio" class="form-control mb-3" placeholder="Valor Servicio" required>
                            <select id="tipoServicio" name="tipoServicio" class="form-control" required>
                                <option value="" selected disabled>Seleccionar</option>
                                <option value="Manteleria">Manteleria</option>
                                <option value="Mesas y sillas">Mesas y sillas</option>
                                <option value="Decoracion">Decoracion</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-primary">Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Actualizar Servicio</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="formulario-servicio-actualizar" onsubmit="return actualizarServicio();">
                        <div class="modal-body">
                            <input type="hidden" id="idServicioActualizar" name="idServicioActualizar" class="form-control mb-3">
                            <input type="text" id="nombreServicioActualizar" name="nombreServicioActualizar" class="form-control mb-3" placeholder="Nombre Servicio">
                            <input type="text" id="valorServicioActualizar" name="valorServicioActualizar" class="form-control mb-3" placeholder="Valor Servicio">
                            <select id="tipoServicioActualizar" name="tipoServicioActualizar" class="form-control">
                                <option value="" selected disabled>Seleccionar</option>
                                <option value="Manteleria">Manteleria</option>
                                <option value="Mesas y sillas">Mesas y sillas</option>
                                <option value="Decoracion">Decoracion</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn btn-success">Actualizar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            <% if (mensajeExito != null) { %>
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: '${mensajeExito}',
                showConfirmButton: true,
                timer: 3000,
                didClose: () => {
                    window.location.href = "PrincipalServlet?menu=Inicio";
                }
            });
            <% } else if (mensajeError != null) { %>
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '<c:out value="${mensajeError}" />',
                showConfirmButton: true,
                timer: 3000,
                didClose: () => {
                    window.location.href = "PrincipalServlet?menu=Inicio";
                }
            });
            <% }%>
        </script>
    </body>

</html>
