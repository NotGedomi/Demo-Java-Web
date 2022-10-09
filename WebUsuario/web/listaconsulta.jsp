<%@page import="java.util.ArrayList"%>
<%@page import="model.CUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>Usuarios</title>
    </head>
    <body>
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                    <%
                        ArrayList<CUsuario> listausuarios = (ArrayList<CUsuario>) request.getAttribute("atribusuarios");
                    %>
                    <h5 class="card-title">CLIENTES</h5>
                    <h6 class="card-subtitle mb-2 text-muted"></h6>
                    <div>
                        <form action="SController" method="POST">
                            <div class="form-group">
                                <label>Cuenta</label>
                                <input type="text" class="form-control" name="txtcuenta" value="${atribusuario.getCuenta()}">
                            </div>
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="txtnombre" value="${atribusuario.getNombre()}">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="txtemail" value="${atribusuario.getEmail()}">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="txtclave" value="${atribusuario.getClave()}">
                                <small class="form-text text-muted">Ingrese números o caractéres especiales</small>
                            </div>
                            <button type="submit" class="btn btn-dark" name="evento" value="Grabar">Registrar</button>
                            <button type="submit" class="btn btn-outline-dark" name="evento" value="Actualizar">Actualizar</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <table class="table">
                    <thead class="bg-dark text-white">
                        <tr>
                            <th scope="col">Cuenta</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Email</th>
                            <th scope="col">Clave</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <%
                        for (CUsuario auxusuario : listausuarios) {
                    %>
                    <tbody>
                    <td><%=auxusuario.getCuenta()%></td>
                    <td><%=auxusuario.getNombre()%></td>
                    <td><%=auxusuario.getEmail()%></td>
                    <td><%=auxusuario.getClave()%></td>
                    <td>
                        <a class="btn btn-danger" href="SController?evento=Eliminar&cuenta=<%=auxusuario.getCuenta()%>">Borrar</a>
                        <a class="btn btn-dark" href="SController?evento=Modificar&cuenta=<%=auxusuario.getCuenta()%>">Editar</a>
                    </td>
                    </tbody>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
