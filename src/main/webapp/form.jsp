<%-- 
    Document   : form
    Created on : 13/02/2024, 10:09:26 p. m.
    Author     : Felipe Rodriguez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
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
        <link rel="stylesheet" href="css/stylesform.css">
    </head>

    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-lg-5">
                <a href="index.jsp"
                   class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img src="images/Logo.png" alt="Logo" class="img-fluid me-2" width="150">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                Eventos
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="infoXV.html">XV Años</a></li>
                                <li><a class="dropdown-item" href="infoBodas.html">Bodas</a></li>
                                <li><a class="dropdown-item" href="infoBautizo.html">Bautizos</a></li>
                                <li><a class="dropdown-item" href="infoComunion.html">Comuniones</a></li>
                                <li><a class="dropdown-item" href="infoGrado.html">Grados</a></li>
                                <li><a class="dropdown-item" href="infoEmpresarial.html">Empresariales</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#!">Servicios</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contacto</a></li>
                    </ul>
                </div>
                <!-- Botón de inicio de sesión -->
                <a href="login.jsp">
                    <button class="btn btn-outline-light ms-auto" type="button">Iniciar sesión</button>
                </a>
            </div>
        </nav>

        <div class="container">
            <form action="FormServlet?crearcotizacion=crearcotizacion" method="POST">
                <div class="row">
                    <div class="col7 col-md-7 col-xl-7">
                        <div class="container">
                            <div class=" text-center mt-3">
                                <h1>Formulario de Cotizacion</h1>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-12 col-lg-12  mx-auto">
                                    <div class="card mt-2 mx-auto bg-light">
                                        <div class="card-body bg-light">
                                            <div class = "container">
                                                <div class="controls">
                                                    <div class="row">
                                                        <div class="col-12 col-md-6">
                                                            <div class="form-group">
                                                                <label for="form_name">Tipo de evento</label>
                                                                <select id="item_type" name="item_type" class="form-control"
                                                                        required="required" data-error="Please select item type">
                                                                    <option value="" selected disabled>Seleccione el evento</option>
                                                                    <option value="XVaños">XV años</option>
                                                                    <option value="Boda">Boda</option>
                                                                    <option value="Bautizo">Bautizo</option>
                                                                    <option value="Comunion">Primera Comunión</option>
                                                                    <option value="Grado">Grado</option>
                                                                    <option value="Empresarial">Reunión empresarial</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <div class="form-group">
                                                                <label for="event_location">Lugar del evento</label>
                                                                <select name="event_location" id="event_location" class="form-control">
                                                                    <option value="" selected disabled>Seleccione una opción</option>
                                                                    <option value="buscar">La empresa buscará el lugar del evento</option>
                                                                    <option value="tengo">Tengo el lugar del evento</option>
                                                                </select>
                                                            </div>

                                                            <div id="tengo_lugar_form" style="display: none;">
                                                                <!-- Segundo formulario para cuando el usuario tiene el lugar del evento -->
                                                                <div class="form-group">
                                                                    <label for="event_name">Nombre del lugar del evento</label>
                                                                    <input id="event_name" type="text" name="event_name"
                                                                           class="form-control"
                                                                           placeholder="Nombre del lugar del evento">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="event_address">Dirección del lugar del
                                                                        evento</label>
                                                                    <input id="event_address" type="text" name="event_address"
                                                                           class="form-control"
                                                                           placeholder="Dirección del lugar del evento">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="event_neighborhood">Nombre del barrio</label>
                                                                    <input id="event_neighborhood" type="text"
                                                                           name="event_neighborhood" class="form-control"
                                                                           placeholder="Nombre del barrio">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 col-md-6">
                                                            <div class="form-group">
                                                                <label for="form_email">Cantidad de personas</label>
                                                                <input id="quantity" type="text" name="quantity" class="form-control" placeholder="Ingrese la cantidad de personas" required="required">
                                                            </div>
                                                        </div>
                                                        <div class="col-12 col-md-6">
                                                            <div class="form-group">
                                                                <label for="toggle_date">Fecha y hora del evento</label>
                                                                <i id="toggle_date_icon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
                                                                <div id="date_container" style="display: none;">
                                                                    <input id="event_date" type="text" name="event_date" class="form-control" required="required">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Input oculto para almacenar la fecha actual -->
                                                        <input id="current_date" type="hidden" name="current_date">
                                                    </div>
                                                    <h3>Manteleria - Manteles</h3>
                                                    <div class="row">
                                                        <p class="col-2 col-md-2">Cant</p>
                                                        <p class="col-4 col-md-4">Servicio</p>
                                                        <p class="col-3 col-md-3">V.Unitario</p>
                                                        <p class="col-3 col-md-3">V.Total</p>

                                                        <c:set var="total_iterations_manteleria" value="${0}" />
                                                        <c:forEach var="manteleria" items="${manteleria}" varStatus="loop">
                                                            <c:set var="total_iterations_manteleria" value="${loop.count}" />
                                                            <div class="col-2 col-md-2">
                                                                <div class="form-group">
                                                                    <input id="service_quantity_manteleria_${loop.index}" type="text" name="service_quantity_manteleria_${loop.index}" class="form-control" placeholder="0" required="required" oninput="calculateTotal(${loop.index}, 'manteleria')" value="0" onkeydown="preventDeletingZero(event)" onkeypress="return onlyNumberKey(event)">
                                                                </div>
                                                            </div>
                                                            <div class="col-4 col-md-4">
                                                                <div class="form-group">
                                                                    <input id="service_name_manteleria_${loop.index}" type="text" name="service_name_manteleria_${loop.index}" class="form-control" placeholder="Nombre del servicio" value="${manteleria.getServicioNombre()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 col-md-3">
                                                                <div class="form-group">
                                                                    <input id="service_price_manteleria_${loop.index}" type="text" name="service_price_manteleria_${loop.index}" class="form-control" placeholder="0" value="${manteleria.getServicioValor()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 col-md-3">
                                                                <div class="form-group">
                                                                    <input id="service_total_price_manteleria_${loop.index}" type="number" name="service_total_price_manteleria_${loop.index}" class="form-control" placeholder="Precio total calculado" readonly>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <input type="hidden" name="total_iterations_manteleria" value="${total_iterations_manteleria}" />
                                                    </div>
                                                    <h3>Mobiliario - Mesas y Sillas</h3>
                                                    <div class="row">
                                                        <p class="col-2 col-md-2">Cant</p>
                                                        <p class="col-4 col-md-4">Servicio</p>
                                                        <p class="col-3 col-md-3">V.Unitario</p>
                                                        <p class="col-3 col-md-3">V.Total</p>

                                                        <c:set var="total_iterations_mesasSillas" value="${0}" />
                                                        <c:forEach var="mesasSillas" items="${mesasysillas}" varStatus="loop">
                                                            <c:set var="total_iterations_mesasSillas" value="${loop.count}" />
                                                            <div class="col-2 col-md-2">
                                                                <div class="form-group">
                                                                    <input id="service_quantity_mesasSillas_${loop.index}" type="text" name="service_quantity_mesasSillas_${loop.index}" class="form-control" placeholder="0" required="required" oninput="calculateTotal(${loop.index}, 'mesasSillas')" value="0" onkeydown="preventDeletingZero(event)" onkeypress="return onlyNumberKey(event)">
                                                                </div>
                                                            </div>
                                                            <div class="col-4 col-md-4">
                                                                <div class="form-group">
                                                                    <input id="service_name_mesasSillas_${loop.index}" type="text" name="service_name_mesasSillas_${loop.index}" class="form-control" placeholder="Nombre del servicio" value="${mesasSillas.getServicioNombre()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 col-md-3">
                                                                <div class="form-group">
                                                                    <input id="service_price_mesasSillas_${loop.index}" type="text" name="service_price_mesasSillas_${loop.index}" class="form-control" placeholder="0" value="${mesasSillas.getServicioValor()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 col-md-3">
                                                                <div class="form-group">
                                                                    <input id="service_total_price_mesasSillas_${loop.index}" type="number" name="service_total_price_mesasSillas_${loop.index}" class="form-control" placeholder="Precio total calculado" readonly>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <input type="hidden" name="total_iterations_mesasSillas" value="${total_iterations_mesasSillas}" />

                                                    </div>
                                                    <h3>Decoración</h3>
                                                    <div class="row">
                                                        <p class="col-2 col-md-2">Cant</p>
                                                        <p class="col-4 col-md-4">Servicio</p>
                                                        <p class="col-3 col-md-3">V.Unitario</p>
                                                        <p class="col-3 col-md-3">V.Total</p>

                                                        <c:set var="total_iterations_decoracion" value="${0}" />
                                                        <c:forEach var="decoracion" items="${decoracion}" varStatus="loop">
                                                            <c:set var="total_iterations_decoracion" value="${loop.count}" />
                                                            <div class="col-2 col-md-2">
                                                                <div class="form-group">
                                                                    <input id="service_quantity_decoracion_${loop.index}" type="text" name="service_quantity_decoracion_${loop.index}" class="form-control" placeholder="0" required="required" oninput="calculateTotal(${loop.index}, 'decoracion')" value="0" onkeydown="preventDeletingZero(event)" onkeypress="return onlyNumberKey(event)">
                                                                </div>
                                                            </div>
                                                            <div class="col-4 col-md-4">
                                                                <div class="form-group">
                                                                    <input id="service_name_decoracion_${loop.index}" type="text" name="service_name_decoracion_${loop.index}" class="form-control" placeholder="Nombre del servicio" value="${decoracion.getServicioNombre()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 col-md-3">
                                                                <div class="form-group">
                                                                    <input id="service_price_decoracion_${loop.index}" type="text" name="service_price_decoracion_${loop.index}" class="form-control" placeholder="0" value="${decoracion.getServicioValor()}" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 col-md-3">
                                                                <div class="form-group">
                                                                    <input id="service_total_price_decoracion_${loop.index}" type="number" name="service_total_price_decoracion_${loop.index}" class="form-control" placeholder="Precio total calculado" readonly>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <input type="hidden" name="total_iterations_decoracion" value="${total_iterations_decoracion}" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col5 col-md-5 col-xl-5 contact-form">
                        <div class="get-in-touch" style="border: solid 2 px; border-color: yellow">
                            <h1 class="title">Datos de Contacto</h1>
                            <div class="form-field col-12 col-md-10 col-lg-10">
                                <input name="name" id="name" class="input-text js-input" type="text" required>
                                <label class="label" for="name">Nombre</label>
                            </div>
                            <div class="form-field col-12 col-md-10 col-lg-10">
                                <input name="last-name" id="last-name" class="input-text js-input" type="text" required>
                                <label class="label" for="last-name">Apellidos</label>
                            </div>
                            <div class="form-field col-12 col-md-10 col-lg-10">
                                <input name="email" id="email" class="input-text js-input" type="email" required>
                                <label class="label" for="email">E-mail</label>
                            </div>
                            <div class="form-field col-12 col-md-10 col-lg-10">
                                <input name="phone" id="phone" class="input-text js-input" type="text" required>
                                <label class="label" for="phone">Telefono</label>
                            </div>
                            <div class="form-field col-12 col-md-10 col-lg-10">
                                <label class="label" for="total_order_price">Precio total del pedido</label>
                                <input name="total_order_price" id="total_order_price" type="number" class="input-text js-input" placeholder="0" readonly>
                            </div>
                            <div class="form-field col-lg-12">
                                <input class="submit-btn" type="submit" value="Submit">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>


        <!-- Footer-->
        <footer class="py-5 bg-dark footer mt-3">
            <div class="container">
                <div class="row">
                    <!-- Parte izquierda del footer -->
                    <div class="col-md-6 text-center text-md-start">
                        <!-- Íconos de redes sociales utilizando Font Awesome -->
                        <a href="#" class="text-white me-4"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-white me-4"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-white me-4"><i class="fab fa-whatsapp"></i></a>
                        <!-- Texto @NewDreams -->
                        <span class="text-white">@NewDreams</span>
                    </div>
                    <!-- Parte derecha del footer -->
                    <div class="col-md-6 text-center text-md-end">
                        <!-- Texto de Copyright -->
                        <p class="m-0 text-white">Copyright &copy; Your Website 2023</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Flatpickr JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>
