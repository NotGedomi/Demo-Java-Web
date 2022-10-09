<%@page import="model.CProducto"%>
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
            CProducto auxproducto = (CProducto) request.getAttribute("atribproducto");
        %>
        <h1>RESULTADO DE CONSULTA DE PRODUCTO</h1>
        <table border="1">
            <tr><td>Codigo:</td><td><%=auxproducto.getCodigo()%></td></tr>
            <tr><td>Descripcion:</td><td><%=auxproducto.getDescripcion()%></td></tr>
            <tr><td>Precio:</td><td><%=auxproducto.getPrecio()%></td></tr>
            <tr><td>Stock:</td><td><%=auxproducto.getStock()%></td></tr> 
            <tr><td>Caracteristicas:</td><td><%=auxproducto.getCrt()%></td></tr>  
        </table>
        <form action="SControllerP" method="POST">
            <input type="submit" name="evento" value="Listar"/>
        </form>
    </body>
</html>
