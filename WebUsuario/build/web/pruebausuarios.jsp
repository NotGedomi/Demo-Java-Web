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
                .seccion1, .btn, .columna{
                    display:none;
                }
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                    <%
                        ArrayList<CUsuario> listausuarios = (ArrayList<CUsuario>) request.getAttribute("atribusuarios");
                    %>
                    <h5 class="card-title">USUARIOS</h5>
                    <h6 class="card-subtitle mb-2 text-muted">En este panel podrás gestionar los datos de los usuarios</h6>
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
                            <button type="submit" class="btn btn-primary" name="evento" value="Grabar">Registrar</button>
                        </form>
                    </div>
                </div>
            </div>
                </div>
                <div class="card">
                    <h5 class="card-header">Datos producto</h5>
                    <div class="card-body">
                        <form action="SControllerV" method="post">
                            <div class="row">
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtcodigo" class="form-control" placeholder="Codigo" value="${atribproducto.getCodigo()}">
                                    <input type="submit" name="evento" value="BuscarProducto" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtdescripcion" class="form-control" placeholder="Nombre Producto" value="${atribproducto.getDescripcion()}">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtprecio" class="form-control" placeholder="$ 0000.00" value="${atribproducto.getPrecio()}">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="number" value="1" name="txtstock" class="form-control" placeholder="Cantidad">
                                </div>
                            </div>
                            <button type="submit" name="evento" value="Grabar" class="btn btn-outline-primary col text-center">AgregarProducto</button>
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Numero de factura</label>
                            <input class="form-control col-md-4" type="text" name="txtnumerofactura">
                        </div>      
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Codigo</th>
                                    <th scope="col">Descripcion</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Total</th>
                                    <th scope="col" class="columna">Acciones</th>
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
                            <td><%=auxventa.getTotal()%></td>
                            <td>
                                <a class="btn btn-warning" href="SControllerV?evento=Eliminar&codigo=<%=auxventa.getCodigo()%>">Eliminar</a>
                                <a class="btn btn-danger" href="SControllerV?evento=Modificar&codigo=<%=auxventa.getCodigo()%>">Modificar</a>
                            </td>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-md-8 text-center">
                            <a class="btn btn-success" onclick="print()" href="Controlador?menu=Ventas&accion=GenerarVenta">Generar Venta</a>
                            <a class="btn btn-danger" href="Controlador?menu=Ventas&accion=NuevaVenta">Nueva Venta</a>

                        </div>
                        <div class="col-md-4">
                            <input type=text" name="txttotalapagar" class="form-control" placeholder="$ 00.000.00" disabled="disabled">
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

