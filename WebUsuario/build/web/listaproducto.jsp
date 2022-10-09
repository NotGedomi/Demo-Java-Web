<%@page import="java.util.ArrayList"%>
<%@page import="model.CProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>Productos</title>
    </head>
    <body>
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                    <%
                        ArrayList<CProducto> listaproductos = (ArrayList<CProducto>) request.getAttribute("atribproductos");
                    %>
                    <h5 class="card-title">PRODUCTOS</h5>
                    <h6 class="card-subtitle mb-2 text-muted"></h6>
                    <div>
                        <form action="SControllerP" method="POST">
                            <div class="form-group">
                                <label>Codigo</label>
                                <input type="text" class="form-control" name="txtcodigo" value="${atribproducto.getCodigo()}">
                            </div>
                            <div class="form-group">
                                <label>Descripción</label>
                                <input type="text" class="form-control" name="txtdescripcion" value="${atribproducto.getDescripcion()}">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="text" class="form-control" name="txtprecio" value="${atribproducto.getPrecio()}">
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="number" class="form-control" name="txtstock" value="${atribproducto.getStock()}">
                            </div>
                            <div class="form-group">
                                <label>Detalles</label>
                                <input type="text" class="form-control" name="txtcaracteristicas" value="${atribproducto.getCrt()}">
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
                            <th scope="col">Codigo</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Detalles</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <%
                        for (CProducto auxproducto : listaproductos) {
                    %>
                    <tbody>
                    <td><%=auxproducto.getCodigo()%></td>
                    <td><%=auxproducto.getDescripcion()%></td>
                    <td><%=auxproducto.getPrecio()%></td>
                    <td><%=auxproducto.getStock()%></td>
                    <td><%=auxproducto.getCrt()%></td>
                    <td>
                        <a class="btn btn-danger" href="SControllerP?evento=Eliminar&codigo=<%=auxproducto.getCodigo()%>">Borrar</a>
                        <a class="btn btn-outline-dark" href="SControllerP?evento=Modificar&codigo=<%=auxproducto.getCodigo()%>">Editar</a>
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
