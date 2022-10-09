<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <div class="container">
        <h1>REGISTRO NUEVO USUARIO</h1>
        <form action="SController" method="POST">
            <br>
            <table border="1">
                <tr><td>Cuenta:</td><td><input type="text" name="txtcuenta"></td></tr>
                <tr><td>Nombre:</td><td><input type="text" name="txtnombre"></td></tr>
                <tr><td>Clave:</td><td><input type="password" name="txtclave"></td></tr>
                <tr><td>Email:</td><td><input type="text" name="txtemail"></td></tr>
            </table>
            <br>
                <input type="submit" name="evento" value="Grabar"/>
        </form>
        </div>
    </body>
</html>
