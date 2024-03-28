<%-- 
    Document   : dashboard
    Created on : 10/02/2024, 6:35:56 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Dreams-Dashboard</title>
        <link rel="stylesheet" href="css/stylesdashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script src="js/scriptPrincipal.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="body-pd">
        <!--Container Main start-->
        <div class="container-">
            <div class="row">
                <div class="col-lg-5 col-md-5">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center align-items-center">
                            <i class="fa-brands fa-wpforms"></i>
                            
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-center">
                            <a class="small text-black stretched-link" onclick="loadContent('PrincipalServlet?menu=Cotizaciones&accion=listar'); return false;">Cotizaciones</a>
                            <div class="small text-black"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center align-items-center">
                            <i class="fa-solid fa-handshake"></i>
                            
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-center">
                            <a class="small text-black stretched-link" onclick="loadContent('PrincipalServlet?menu=Eventos'); return false;">Eventos</a>
                            <div class="small text-black"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center align-items-center">
                            <i class="fa-solid fa-sliders"></i>
                            
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-center">
                            <a class="small text-black stretched-link" onclick="loadContent('PrincipalServlet?menu=Servicios'); return false;">Servicios</a>
                            <div class="small text-black"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center align-items-center">
                            <i class="fa-solid fa-users"></i>
                            
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-center">
                            <a class="small text-black stretched-link" onclick="loadContent('PrincipalServlet?menu=Clientes&accion=listar'); return false;">Clientes</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center align-items-center">
                            <i class="fa-solid fa-magnifying-glass-chart"></i>
                            
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-center">
                            <a class="small text-black stretched-link" onclick="loadContent('PrincipalServlet?menu=Estados'); return false;">Estados</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5">
                    <div class="card bg-info text-white">
                        <div class="card-body text-center align-items-center">
                            <i class="fa-solid fa-money-check-dollar"></i>
                            
                        </div>
                        <div class="card-footer d-flex align-items-center justify-content-center">
                            <a class="small text-black stretched-link" href="#">Pagos</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>

