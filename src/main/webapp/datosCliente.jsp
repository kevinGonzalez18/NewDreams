<%-- 
    Document   : datosCliente
    Created on : 16/04/2024, 11:29:59 p. m.
    Author     : feli1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
        <div class="container">
            <div class="row">
                <div class="get-in-touch">
                    <h1 class="title">Datos Personales</h1>
                    <form id="form2" class="contact-form row" action="PerfilClienteServlet?actualizarCliente=actualizarCliente" method="POST">
                        <c:forEach var="cliente" items="${datos}">
                            <div class="form-field col-lg-6">
                                <input name="name" id="name" class="input-text js-input" type="text" value="${cliente[1]}">
                                <label class="label" for="name">Nombre</label>
                            </div>
                            <div class="form-field col-lg-6 ">
                                <input name="last-name" id="last-name" class="input-text js-input" type="text" value="${cliente[2]}">
                                <label class="label" for="last-name">Apellidos</label>
                            </div>
                            <div class="form-field col-lg-6 ">
                                <input name="email" id="email" class="input-text js-input" type="email" value="${cliente[0]}" readonly >
                                <label class="label" for="email">E-mail</label>
                            </div>
                            <div class="form-field col-lg-6 ">
                                <input name="phone" id="phone" class="input-text js-input" type="text" value="${cliente[3]}">
                                <label class="label" for="phone">Telefono</label>
                            </div>
                        </c:forEach>
                        <div class="form-field col-lg-12">
                            <input class="submit-btn" type="submit" value="Submit">
                        </div>
                    </form>
                </div>
                <!-- Modal de éxito -->
                <div id="modalExito" class="modal" style="display:none;">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>¡Actualización exitosa!</p>
                    </div>
                </div>

                <!-- Modal de error -->
                <div id="modalError" class="modal" style="display:none;">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>¡Error en la actualización!</p>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Función para mostrar un modal según el resultado de la actualización
            function mostrarModal(actualizacionExitosa) {
                var modal;
                if (actualizacionExitosa) {
                    modal = document.getElementById("modalExito");
                } else {
                    modal = document.getElementById("modalError");
                }
                modal.style.display = "block";
            }

            // Cerrar el modal cuando se haga clic en la "x"
            var closeButtons = document.getElementsByClassName("close");
            for (var i = 0; i < closeButtons.length; i++) {
                closeButtons[i].onclick = function () {
                    this.parentElement.parentElement.style.display = "none";
                }
            }

            // También puedes cerrar el modal haciendo clic fuera del mismo
            window.onclick = function (event) {
                if (event.target.classList.contains("modal")) {
                    event.target.style.display = "none";
                }
            }
            var actualizacionExitosa = <c:out value="${actualizacionExitosa}" />;
            mostrarModal(actualizacionExitosa);
        </script>
    </body>
</html>
