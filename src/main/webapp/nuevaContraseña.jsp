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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="css/styleslogin.css">
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body oncontextmenu='return false'>
        <div>
            <!-- Container containing all contents -->
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
                                    <h2 class="text-center">Reestablezca su contraseña</h2>
                                    <form class="p-3 mt-3" action="NuevaContrasenaServlet" method="post">
                                        <div class="form-field d-flex align-items-center">
                                            <span class="far fa-envelope"></span>
                                            <input type="text" name="password" placeholder="New Password" class="form-control" type="text" required="required">
                                        </div>
                                        <div class="form-field d-flex align-items-center">
                                            <span class="far fa-envelope"></span>
                                            <input type="password" name="confPassword" placeholder="Confirm New Password" class="form-control" type="text" required="required">
                                        </div>
                                        <button class="btn mt-3">Reestablecer</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>