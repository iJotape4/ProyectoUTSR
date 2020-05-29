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
        <style>
            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                font-family: 'Nunito', sans-serif;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
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
            <br>
            <h2>Graduados</h2>
            <br>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cédula</th>
                        <th>Fecha de nacimiento</th>
                        <th>Correo</th>
                        <th>Télefono</th>
                        <th>Dirección</th>
                        <th>Estrato Social</th>
                        <th>Beca</th>
                        <th>Carrera</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="fila" items="${bellamy.rows}">
                    <tr>
                    <td><c:out value="${fila.grad_id}"/> </td>
                    <td><c:out value="${fila.grad_nombre}"/> </td>
                    <td><c:out value="${fila.grad_cedula}"/> </td>
                    <td><c:out value="${fila.grad_fnacimiento}"/> </td>
                    <td><c:out value="${fila.grad_correo}"/> </td>
                    <td><c:out value="${fila.grad_tel}"/> </td>
                    <td><c:out value="${fila.grad_direccion}"/> </td>
                    <td><c:out value="${fila.grad_estsocial}"/> </td>
                    <td><c:out value="${fila.grad_beca}"/> </td>
                    <td><c:out value="${fila.carrera}"/> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
            
                <div class="links">
                    <a href="index.jsp">Regresar</a>
                    <a href="/">Insertar Graduado</a>
                </div>
        </div>
    </body>
</html>
