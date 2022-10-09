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
        <% String auxcuenta = (String) request.getAttribute("cuenta");
            String auxnombre = (String) request.getAttribute("nombre");
            String auxclave = (String) request.getAttribute("clave");
            String auxemail = (String) request.getAttribute("email");
        %>
        <h1>REGISTRO NUEVO SATISFACTORIO</h1>
        <form action="SController" method="POST">
            <table border="1">
                <tr><td>Cuenta:</td><td><%=auxcuenta%></td></tr>
                <tr><td>Nombre:</td><td><%=auxnombre%></td></tr>
                <tr><td>Clave:</td><td><%=auxclave%></td></tr>
                <tr><td>Email:</td><td><%=auxemail%></td></tr>
            </table>
            <input type="submit" name="evento" value="Listar"/>
        </form>
            <form action="index.jsp" method="POST">
                <input type="submit" value="Regresar"/>
            </form>
    </body>
</html>
