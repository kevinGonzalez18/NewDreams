<%-- 
    Document   : perfilCliente
    Created on : 11/02/2024, 1:50:04 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>New Dreams-Dashboard</title>
        <!-- meta tags requeridos -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <!--Aqui ira la imagen del icono que se muestra en el head-->
        <link rel="icon" href="#" type="image/x-icon">
        <!-- Bootstrap y CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylescliente.css">
    </head>

    <body>

        <div class="wrapper">
            <!-- Sidebar -->
            <aside id="sidebar">
                <div class="h-100">
                    <div class="sidebar-logo">
                        <img src="images/Logo.png" alt="logo">
                        <%
                            String usuario = (String) session.getAttribute("usuario");
                            String rol = (String) session.getAttribute("rol");
                        %>
                        <a href="#"><%= usuario%></a>
                        <a href="#"><%= rol%></a>

                    </div>
                    <!-- Navegacion del sidebar -->
                    <ul class="sidebar-nav">
                        <li class="sidebar-item">
                            <a href="PerfilClienteServlet?menu=dashboard" class="sidebar-link">
                                <i class="fa-solid fa-users pe-2"></i>
                                Inicio
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="PerfilClienteServlet?menu=historialEventos" class="sidebar-link">
                                <i class="fa-solid fa-users pe-2"></i>
                                Historial de eventos
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="PerfilClienteServlet?menu=historialPagos" class="sidebar-link">
                                <i class="fa-solid fa-users pe-2"></i>
                                Historial de pagos
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="PerfilClienteServlet?menu=misDatos&&accion=datos&correo=<%= usuario%>" class="sidebar-link">
                                <i class="fa-solid fa-users pe-2"></i>
                                Mis datos
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link" id="logoutButton" name="logoutButton">
                                <i class="fa-solid fa-right-from-bracket pe-2"></i>
                                Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>
            <!-- Componente principal (MAIN) -->
            <div class="main">
                <nav class="navbar navbar-expand px-3 border-bottom">
                    <!-- Boton para sidebar toggle -->
                    <button class="btn" type="button" data-bs-theme="dark">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </nav>
                <main class="content px-3 py-2" name="main" id="main">
                    <div class="container-fluid">
                        <div class="mb-3">
                            <!--Aqui ira el contenido de cada vista-->
                        </div>
                    </div>
                </main>
            </div>
        </div>


        <!-- JavaScript scripts --> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/909a90592e.js" crossorigin="anonymous"></script>
        <script src="js/scriptsCliente.js"></script>


    </body>
</html>

