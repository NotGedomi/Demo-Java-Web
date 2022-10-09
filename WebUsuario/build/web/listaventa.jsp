<%@page import="java.util.ArrayList"%>
<%@page import="model.CUsuario"%>
<%@page import="model.CProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>Sistema de ventas</title>
        <style>
            @media print{
                .seccion1, .btn, .columna,.accion{
                    display:none;
                }
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-5 seccion1">
                <div class="card">
                    <h5 class="card-header">Datos usuario</h5>
                    <div class="card-body">
                        <%
                            ArrayList<CProducto> listaventas = (ArrayList<CProducto>) request.getAttribute("atribventas");
                        %>
                        <form method="post" action="SControllerV">
                            <div class="row">
                                <div class="col-md-6 d-flex">
                                    <input type="text" name="txtcuenta" class="form-control" placeholder="Cliente">
                                    <input type="submit" name="evento" value="BuscarUsuario" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-6 d-flex">
                                    <input type="text" name="txtcuenta" class="form-control bg-dark text-white" placeholder="Nombre cliente" value="${atribusuario.getCuenta()}">
                                </div>
                            </div>
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
                <div class="card">
                    <h5 class="card-header">Datos producto</h5>
                    <div class="card-body">
                        <form action="SControllerV" method="POST">
                            <div class="row">
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtcodigo" class="form-control" placeholder="Codigo" value="${atribproducto.getCodigo()}">
                                    <input type="submit" name="evento" value="BuscarProducto" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtdescripcion" class="form-control bg-dark text-white" placeholder="Nombre Producto" value="${atribproducto.getDescripcion()}">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtprecio" class="form-control bg-dark text-white" placeholder="S.00.00" value="${atribproducto.getPrecio()}">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="number" value="1" name="txtstock" class="form-control bg-dark text-white" placeholder="Cantidad">
                                </div>
                            </div>
                            <button type="submit" name="evento" value="Grabar" class="btn btn-outline-dark col text-center">Agregar Producto</button>
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <table class="table">
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th scope="col">Codigo</th>
                                    <th scope="col">Descripcion</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Subtotal</th>
                                    <th class="accion" scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <%
                                for (CProducto auxventa : listaventas) {
                            %>
                            <tbody>
                            <td><%=auxventa.getCodigo()%></td>
                            <td><%=auxventa.getDescripcion()%></td>
                            <td><%=auxventa.getPrecio()%></td>
                            <td><%=auxventa.getStock()%></td>
                            <td><%=auxventa.getSubtotal()%></td>
                            <td>
                                <a class="btn btn-danger" href="SControllerV?evento=Eliminar&codigo=<%=auxventa.getCodigo()%>">Borrar</a>
                            </td>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-md-8 col-md-12 center-block">
                            <a class="btn btn-dark" onclick="print()" href="SControllerV?evento=Listar">Boleta</a>
                            <a class="btn btn-outline-dark" href="SControllerV?evento=Listar">Nueva Venta</a>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        -->
    </body>
</html>
