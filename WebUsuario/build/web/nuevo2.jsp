<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Nuevo Producto</title>
    </head>
    <body>
        <h1>REGISTRO NUEVO PRODUCTO</h1>
        <form action="SControllerP" method="POST">
            <table border="1">
                <tr><td>Codigo:</td><td><input type="text" name="txtcodigo"></td></tr>
                <tr><td>Descripcion:</td><td><input type="text" name="txtdescripcion"></td></tr>
                <tr><td>Precio:</td><td><input type="text" name="txtprecio"></td></tr>
                <tr><td>Stock:</td><td><input type="text" name="txtstock"></td></tr>
                <tr><td>Caracteristicas:</td><td><input type="text" name="txtcaracteristicas"></td></tr>
            </table>
                <input type="submit" name="evento" value="Grabar"/>
        </form>
    </body>
</html>
