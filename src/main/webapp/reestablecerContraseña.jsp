<%-- 
    Document   : reestablecerContraseña
    Created on : 27/02/2024, 5:12:28 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>New Dreams-Inicio</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/styleslogin.css">
    </head>
    <body>
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a></li>
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
        </nav>

        <div class="wrapper">
            <div class="logo">
                <img src="images/Logo.png" alt="New Dreams">
            </div>
            <form class="p-3 mt-3" action="reestablecerContrasenaServlet" method="post">
                <p>Ingresa tu correo electronico para reestablecer tu contraseña</p>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-envelope"></span>
                    <input type="email" name="email" id="email" placeholder="Correo electrónico">
                </div>
                <button class="btn mt-3">Restablecer contraseña</button>
            </form>
        </div>


        <footer class="py-5 bg-dark footer mt-3">
            <div class="container">
                <div class="row">
                    <!-- Parte izquierda del footer -->
                    <div class="col-md-6 text-center text-md-start">
                        <!-- Íconos de redes sociales utilizando Font Awesome -->
                        <a href="https://www.facebook.com/juliansanabria08" class="text-white me-4"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://www.instagram.com/newdreams_cocinaoculta/" class="text-white me-4"><i class="fab fa-instagram"></i></a>
                        <a href="https://api.whatsapp.com/send?phone=573192584986" class="text-white me-4"><i class="fab fa-whatsapp"></i></a>
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
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
