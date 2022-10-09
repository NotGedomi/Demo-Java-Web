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

        <title>Hello, world!</title>
    </head>
    <body>
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                    <%
                        CProducto auxproducto = (CProducto) request.getAttribute("atribproducto");
                    %>
                    <h5 class="card-title">Modificar Usuario</h5>
                    <h6 class="card-subtitle mb-2 text-muted">En este panel podrás editar los datos de los usuarios</h6>
                    <div>
                        <form action="SControllerP" method="POST">
                            <div class="form-group">
                                <label>Codigo</label>
                                <input type="text" class="form-control" name="txtcodigo" value="<%=auxproducto.getCodigo()%>">
                            </div>
                            <div class="form-group">
                                <label>Descripción</label>
                                <input type="text" class="form-control" name="txtdescripcion" value="<%=auxproducto.getDescripcion()%>">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="text" class="form-control" name="txtprecio" value="<%=auxproducto.getPrecio()%>">
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="number" class="form-control" name="txtstock" value="<%=auxproducto.getStock()%>">
                            </div>
                            <div class="form-group">
                                <label>Detalles</label>
                                <input type="text" class="form-control" name="txtcaracteristicas" value="<%=auxproducto.getCrt()%>">
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
