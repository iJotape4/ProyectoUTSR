<%-- 
    Document   : addgraduado
    Created on : 29/05/2020, 04:23:51 PM
    Author     : Jotape
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion/conexion.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Registrar graduado</title>
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
                text-align: center;
                padding-top: 20px;
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
                margin-left: 20%;
                margin-right:  20%;
                text-align: left;
                width: 60%;
            }
            .tableid {     
                margin-left: 10%;
                margin-right:  10%;
                text-align: center;
                width: 80%;
            }
        </style>
    </head>
    <body>
        <c:if test="${param.nombre == null}">
            <div class="links">
                <a href="index.jsp">Regresar</a>
            </div>
        <div class="center">
            <div class="content">
                <h1>Insertar graduado</h1>
            </div>
            <form method="post">
                <table class="table table-dark">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value=""></td>
                    </tr>
                    <tr><td><span>Cédula</span></td>
                        <td><input type="text" name="cedula" value="" class="form-control"></td>
                    </tr>
                    <tr><td><span>Nombre</span></td>
                        <td><input type="text" name="nombre" value="" class="form-control"></td>
                    </tr>
                    <tr><td><span>Fecha de Nacimiento</span></td>
                        <td><input type="text" name="fnacimiento" value="" class="form-control"></td>
                    </tr>
                    <tr><td><span>Correo</span></td>
                        <td><input type="text" name="correo" value="" class="form-control"></td>
                    </tr>
                    <tr><td><span>Télefono</span></td>
                        <td><input type="text" name="telefono" value="" class="form-control"></td>
                    </tr>
                    <tr><td><span>Direccion</span></td>
                        <td><input type="text" name="direccion" value="" class="form-control"></td>
                    </tr>
                    <tr><td><span>Estrato Social</span></td>
                        <td>
                            <select name="est_social" style="width: 100%" class="form-control">
                                <option value="0">--Seleccione --</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td><span>¿Es usted becado?</span></td>
                        <td>
                            <select name="beca" style="width: 100%" class="form-control">
                                <option value="0">--Seleccione --</option>
                                <option value="Si">Si</option>
                                <option value="No">No</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td><span>Carrera</span></td>
                        <td>
                    <sql:query var="rx" dataSource="${proyectouts}">
                        SELECT * FROM carrera
                    </sql:query>
                    <select name="carr_id" style="width: 100%" class="form-control">
                        <option value="0">--Seleccione --</option>
                        <c:forEach var="item" items="${rx.rows}">
                            <option value="${item.carr_id}">
                            <c:out value="${item.carr_nombre}"></c:out>
                            </option>
                        </c:forEach>
                    </select>
                    </td>
                    </tr>
                    <tr><td><span>Sede</span></td>
                        <td>
                    <sql:query var="rs" dataSource="${proyectouts}">
                        SELECT * FROM sede
                    </sql:query>
                    <select name="sede_id" style="width: 100%" class="form-control">
                        <option value="0">--Seleccione --</option>
                        <c:forEach var="item" items="${rs.rows}">
                            <option value="${item.sede_id}">
                            <c:out value="${item.sede_nombre}"></c:out>
                            </option>
                        </c:forEach>
                    </select>
                    </td>
                    </tr>
                </table>
                <br>
                <table class="tableid">
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-secondary">Agregar</button>
                        </td>
                    </tr>
                </table>            
            </form>
        </div>
    </c:if>

    <c:if test="${param.nombre != null}">
        <sql:update var="result" dataSource="${proyectouts}">
            INSERT INTO
            graduados(grad_cedula,grad_nombre,grad_fnacimiento,grad_correo,grad_tel,grad_direccion,grad_estsocial,
            grad_beca,grad_carr_id,grad_sede_id)
            VALUES('${param.cedula}',
            '${param.nombre}',
            '${param.fnacimiento}',
            '${param.correo}',
            '${param.telefono}',
            '${param.direccion}',
            ${param.est_social},
            '${param.beca}',
            ${param.carr_id},
            ${param.sede_id}
            );
        </sql:update>
        <c:if test="${result==1}">
            <div class="content">
                <p style="font-weight: bold;">Registro agreagado con éxito!</p>
                <a href="index.jsp" class="btn btn-light">Regresar</a>
            </div>

        </c:if>
    </c:if>
    </body>
</html>
