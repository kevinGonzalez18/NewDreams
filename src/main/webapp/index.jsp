<%-- 
    Document   : index
    Created on : 10/02/2024, 6:37:03 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/stylesindex.css">
    </head>

    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-lg-5">
                <a href="IndexResponsive.html"
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Inicio</a></li>
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



        <!-- Header-->
        <header>
            <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/bodas.webp" class="d-block w-100" alt="Slide 1" style="max-height: 60vh;">
                        <div class="container">
                            <div class="carousel-caption text-start">
                                <h1>Example headline.</h1>
                                <p>Some representative placeholder content for the first slide of the carousel.</p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/bautizos.webp" class="d-block w-100 img-fluid" alt="img"
                             style="max-height: 60vh;">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Hola</h5>
                            <p>Algo de contenido representativo para el primer slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/quinces.webp" class="d-block w-100" alt="Slide 3" style="max-height: 60vh;">
                        <div class="container">
                            <div class="carousel-caption text-end">
                                <h1>One more for good measure.</h1>
                                <p>Some representative placeholder content for the third slide of this carousel.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </header>

        <div class="container mt-3">
            <div class="row">
                <!-- Icono 1 -->
                <div class="col-sm-12 col-md-4">
                    <div class="icon-block text-center">
                        <h2><i class="fas fa-star-half-alt"></i></h2>
                        <h5>Creatividad y Personalización</h5>
                        <p class="light">New Dreams ofrece un enfoque creativo y personalizado para cada evento, adaptándose a las necesidades y deseos específicos de cada cliente.
                            Esto implica la capacidad de generar ideas innovadoras y diseñar experiencias únicas que se ajusten al estilo y la visión de nuestros clientes.</p>
                    </div>
                </div>

                <!-- Icono 2 -->
                <div class="col-sm-12 col-md-4">
                    <div class="icon-block text-center">
                        <h2><i class="fas fa-sitemap"></i></h2>
                        <h5>Profesionalismo y Organización</h5>
                        <p class="light">Es fundamental para New Dreams demuestrar un alto nivel de profesionalismo en todas las etapas del proceso, desde la planificación inicial hasta la ejecución del evento. Esto incluye una comunicación clara y efectiva, una gestión eficiente de los recursos y un compromiso total con la excelencia en cada detalle.</p>
                    </div>
                </div>

                <!-- Icono 3 -->
                <div class="col-sm-12 col-md-4">
                    <div class="icon-block text-center">
                        <h2><i class="fas fa-smile"></i></h2>
                        <h5>Atención al Cliente y Servicio Excepcional</h5>
                        <p class="light">New Dreams prioriza la satisfacción del cliente en todo momento, brindando un servicio excepcional que supere las expectativas. Esto implica escuchar activamente las necesidades del cliente, ofrecer soluciones personalizadas, y estar disponibles para atender cualquier consulta o solicitud durante todo el proceso del evento.</p>
                    </div>
                </div>
            </div>
        </div>


        <!-- Page Content-->
        <div class="pt-4 p-5" class="py-5">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 mt-3 g-4">
                <!-- Primera columna -->
                <div class="col">
                    <!-- Tarjeta de contenido -->
                    <div class="card">
                        <!-- Imagen en la parte superior de la tarjeta -->
                        <img src="images/quinces.webp" class="card-img-top" alt="quinces">
                        <!-- Cuerpo de la tarjeta -->
                        <div class="card-body">
                            <!-- Título de la tarjeta -->
                            <h5 class="card-title">XV AÑOS</h5>
                            <!-- Texto descriptivo en la tarjeta -->
                            <p class="card-text">"Los XV años: un sueño hecho realidad, un momento para brillar y recordar toda la vida."</p>
                            <!-- Enlace a eventosInfo.html dentro de la tarjeta -->
                            <a href="infoXV.html" class="btn btn-primary">Más información</a>
                        </div>
                    </div>
                </div>
                <!-- Segunda columna -->
                <div class="col">
                    <!-- Tarjeta de contenido -->
                    <div class="card">
                        <!-- Imagen en la parte superior de la tarjeta -->
                        <img src="images/bodas.webp" class="card-img-top" alt="boda">
                        <!-- Cuerpo de la tarjeta -->
                        <div class="card-body">
                            <!-- Título de la tarjeta -->
                            <h5 class="card-title">BODAS</h5>
                            <!-- Texto descriptivo en la tarjeta -->
                            <p class="card-text">"En el día más importante de sus vidas, hacemos realidad el cuento de hadas que siempre soñaron: su boda perfecta, llena de amor, magia y momentos inolvidables."</p>
                            <!-- Enlace a eventosInfo.html dentro de la tarjeta -->
                            <a href="infoBodas.html" class="btn btn-primary">Más información</a>
                        </div>
                    </div>
                </div>
                <!-- Tercera columna -->
                <div class="col">
                    <!-- Tarjeta de contenido -->
                    <div class="card">
                        <!-- Imagen en la parte superior de la tarjeta -->
                        <img src="images/comunion.webp" class="card-img-top" alt="comunion">
                        <!-- Cuerpo de la tarjeta -->
                        <div class="card-body">
                            <!-- Título de la tarjeta -->
                            <h5 class="card-title">BAUTIZOS</h5>
                            <!-- Texto descriptivo en la tarjeta -->
                            <p class="card-text">"En el dulce y sagrado día del bautizo, creamos un ambiente de amor y bendiciones, marcando el inicio de una vida llena de fe y alegría."</p>
                            <!-- Enlace a eventosInfo.html dentro de la tarjeta -->
                            <a href="infoComunion.html" class="btn btn-primary">Más información</a>
                        </div>
                    </div>
                </div>
                <!-- Cuarta columna -->
                <div class="col">
                    <!-- Tarjeta de contenido -->
                    <div class="card">
                        <!-- Imagen en la parte superior de la tarjeta -->
                        <img src="images/bautizos.webp" class="card-img-top" alt="bautizo">
                        <!-- Cuerpo de la tarjeta -->
                        <div class="card-body">
                            <!-- Título de la tarjeta -->
                            <h5 class="card-title">PRIMERAS COMUNIONES</h5>
                            <!-- Texto descriptivo en la tarjeta -->
                            <p class="card-text">"En la celebración de la Primera Comunión, transformamos la fe en una experiencia inolvidable, llenando el corazón de paz y alegría en este paso significativo hacia la vida espiritual."</p>
                            <!-- Enlace a eventosInfo.html dentro de la tarjeta -->
                            <a href="infoBautizo.html" class="btn btn-primary">Más información</a>
                        </div>
                    </div>
                </div>
                <!-- Quinta columna -->
                <div class="col">
                    <!-- Tarjeta de contenido -->
                    <div class="card">
                        <!-- Imagen en la parte superior de la tarjeta -->
                        <img src="images/grados.webp" class="card-img-top" alt="grado">
                        <!-- Cuerpo de la tarjeta -->
                        <div class="card-body">
                            <!-- Título de la tarjeta -->
                            <h5 class="card-title">GRADOS</h5>
                            <!-- Texto descriptivo en la tarjeta -->
                            <p class="card-text">"En la graduación, celebramos el esfuerzo, la dedicación y los logros, marcando el inicio de un nuevo capítulo lleno de oportunidades y éxitos."</p>
                            <!-- Enlace a eventosInfo.html dentro de la tarjeta -->
                            <a href="infoGrado.html" class="btn btn-primary">Más información</a>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <!-- Tarjeta de contenido -->
                    <div class="card">
                        <!-- Imagen en la parte superior de la tarjeta -->
                        <img src="images/reuniones.webp" class="card-img-top" alt="reunion">
                        <!-- Cuerpo de la tarjeta -->
                        <div class="card-body">
                            <!-- Título de la tarjeta -->
                            <h5 class="card-title">REUNIONES EMPRESARIALES</h5>
                            <!-- Texto descriptivo en la tarjeta -->
                            <p class="card-text">"En las reuniones empresariales, creamos el ambiente ideal para la colaboración, la innovación y el éxito, impulsando el crecimiento y la excelencia en cada encuentro."</p>
                            <!-- Enlace a eventosInfo.html dentro de la tarjeta -->
                            <a href="infoEmpresarial.html" class="btn btn-primary">Más información</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
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
