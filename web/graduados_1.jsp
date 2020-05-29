<%-- 
    Document   : graduados
    Created on : 29/05/2020, 09:47:56 AM
    Author     : Jotape
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion/conexion.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graduados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <style>
            html, body {
                background-color: #fff;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }
            .links > a {
                color: blue;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }
            .center {
                text-align: center;
            }
                
             .content {
                 margin-top: 30px;
                 margin-bottom: 10px;
                 color: #636b6f;
                 font-size: 30px;
                 text-transform: uppercase;
            }
            .table {  
                text-align: left;
                margin-left: 320px;
                width: 50%;
            }
        </style>
    </head>
    <body>
        <sql:query dataSource="${proyectouts}" var="bellamy"> 
            select grad_id, grad_nombre, grad_cedula, grad_fnacimiento, grad_correo, grad_tel, grad_direccion, grad_estsocial, grad_beca, carrera.carr_nombre as carrera
            from graduados
            left join carrera
            on grad_carr_id = carr_id
        </sql:query>
        <div class="center">
            <div class="content">
                <h1>Graduados</h1>
                 </div>  
            <p>Ésta es una tabla reducida, para ver su versión completa haga click en la cédula de cualquier usuario.</p>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Cédula</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Carrera</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="fila" items="${bellamy.rows}">
                    <tr>
                        <td><a href="graduados.jsp"><c:out value="${fila.grad_cedula}"/></a></td>
                    <td><c:out value="${fila.grad_nombre}"/> </td>
                    <td><c:out value="${fila.carrera}"/> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
            
                <div class="links">
                    <a href="index.jsp">Regresar</a>
                </div>
        </div>
    </body>
</html>
