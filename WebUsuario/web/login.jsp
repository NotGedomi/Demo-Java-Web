<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Login</title>
    </head>
    
    <!------ Include the above in your HEAD tag ---------->

    <body>
        <div id="login">
            <h3 class="text-center text-dark pt-5">INGRESO</h3>
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" class="form" action="SLogin" name="ingreso" method="post">
                                <div class="form-group">
                                    <label for="username" class="text-dark">Correo:</label><br>
                                    <input type="text" class="form-control" placeholder="usuario" name="txtcuenta">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-dark">Contraseña:</label><br>
                                    <input type="password" class="form-control" placeholder="contraseña" name="txtclave">
                                </div>
                                <div class="form-group">
                                    <label for="remember-me" class="text-dark"><span>Recordarme</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                    <input type="submit" name="accion" class="btn btn-dark btn-md" value="Ingresar">
                                </div>
                                <div id="register-link" class="text-right">
                                    <a href="#" class="text-dark">Registrarse</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
