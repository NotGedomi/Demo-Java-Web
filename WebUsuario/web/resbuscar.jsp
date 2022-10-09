<%@page import="model.CUsuario"%>
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
        <%
            CUsuario auxusuario = (CUsuario) request.getAttribute("atribusuario");
        %>
        <h1>RESULTADO DE CONSULTA DE USUARIO</h1>
        <table border="1">
            <tr><td>Cuenta:</td><td><%=auxusuario.getCuenta()%></td></tr>
            <tr><td>Nombre:</td><td><%=auxusuario.getNombre()%></td></tr>
            <tr><td>Clave:</td><td><%=auxusuario.getClave()%></td></tr>
            <tr><td>Email:</td><td><%=auxusuario.getEmail()%></td></tr>  
        </table>
        <form action="SController" method="POST">
            <input type="submit" name="evento" value="Listar"/>
        </form>
    </body>
</html>
