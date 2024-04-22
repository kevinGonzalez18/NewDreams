<%-- 
    Document   : modal_cotizantes
    Created on : 17/04/2024, 4:56:47 p. m.
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <!-- Código del modal -->
        <div id="modalContenido" class="modal">
            <div class="modal-content">
                <span class="close" onclick="cerrarModal()">&times;</span>
                <div id="contenidoModal">
                    <div id="formulario-crear" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Crear Cliente</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="formulario-crear-cliente" action="PrincipalServlet?menu=Cotizantes" method="POST">
                                        <div class="form-group">
                                            <label for="correo">Correo Cotizante:</label>
                                            <input type="email" class="form-control" id="correoClt" name="correoClt" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="contrasena">Contraseña:</label>
                                            <input type="password" class="form-control" id="contrasenaClt" name="contraseñaClt" required autocomplete="current-password">>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" id="btn-guardar">Guardar</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Script para mostrar el modal y cargar la vista HTML dentro de él -->
        <script>
            $(document).ready(function () {
                // Realiza una solicitud AJAX al servlet para obtener el contenido de la vista HTML
                $.get("PrincipalServlet", function (data) {
                    // Inserta el contenido dentro del modal
                    $("#contenidoModal").html(data);
                    // Muestra el modal
                    $("#modalContenido").show();
                });
            });

            // Función para cerrar el modal
            function cerrarModal() {
                $("#modalContenido").hide();
            }
        </script>
    </body>
</html>
