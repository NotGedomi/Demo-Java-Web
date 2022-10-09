<%@page import="model.CUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>Hello, world!</title>
    </head>
    <body>
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                    <%
                        CUsuario auxusuario = (CUsuario) request.getAttribute("atribusuario");
                    %>
                    <h5 class="card-title">Modificar Usuario</h5>
                    <h6 class="card-subtitle mb-2 text-muted">En este panel podrás editar los datos de los usuarios</h6>
                    <div>
                        <form action="SController" method="POST">
                            <div class="form-group">
                                <label>Cuenta</label>
                                <input type="text" class="form-control" name="txtcuenta" value="<%=auxusuario.getCuenta()%>">
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="txtnombre" value="<%=auxusuario.getNombre()%>">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="txtemail" value="<%=auxusuario.getEmail()%>">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="txtclave" value="<%=auxusuario.getClave()%>">
                                <small class="form-text text-muted">Ingrese números o caractéres especiales</small>
                            </div>
                            <button type="submit" class="btn btn-success" name="evento" value="Actualizar">Actualizar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>