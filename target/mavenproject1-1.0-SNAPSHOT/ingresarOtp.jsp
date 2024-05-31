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
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <div class="wrapper">
                                    <div class="logo">
                                        <img src="images/Logo.png" alt="New Dreams">
                                    </div>
                                    <h2 class="text-center">Ingrese el OTP</h2>
                                    <%
                                        if (request.getAttribute("message") != null) {
                                            out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
                                        }

                                    %>
                                    <form class="p-3 mt-3" action="ValidarOtpServlet" method="post">
                                        <div class="form-field d-flex align-items-center">
                                            <span class="far fa-envelope"></span>
                                            <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                                        </div>
                                        <button class="btn mt-3">Enviar OTP</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>