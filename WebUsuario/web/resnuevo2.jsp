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
        <% String auxcodigo = (String) request.getAttribute("codigo");
            String auxdescripcion = (String) request.getAttribute("descripcion");
            String auxprecio = (String) request.getAttribute("precio");
            String auxstock = (String) request.getAttribute("stock");
            String auxcrt = (String) request.getAttribute("crt");
        %>
        <h1>REGISTRO NUEVO SATISFACTORIO</h1>
        <form action="SControllerP" method="POST">
            <table border="1">
                <tr><td>Codigo:</td><td><%=auxcodigo%></td></tr>
                <tr><td>Descripcion</td><td><%=auxdescripcion%></td></tr>
                <tr><td>Precio:</td><td><%=auxprecio%></td></tr>
                <tr><td>Stock:</td><td><%=auxstock%></td></tr>
                <tr><td>Caracteristicas:</td><td><%=auxcrt%></td></tr>
            </table>
            <input type="submit" name="evento" value="Listar"/>
        </form>
            <form action="index.jsp" method="POST">
                <input type="submit" value="Regresar"/>
            </form>
    </body>
</html>
