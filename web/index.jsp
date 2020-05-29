<%-- 
    Document   : index
    Created on : 14/05/2020, 08:03:48 PM
    Author     : Edwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>UTS</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
                color: greenyellow;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
                font-size: 70px;
            }
        </style>
    </head>
    <body>
    <div class="flex-center position-ref full-height">
         
                <div class="top-right links">
                    <img 
                        src="data:image/jpeg;base64,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" 
                        width="150px" height="100px">
                </div>
            <div class="content">
                <div class="title m-b-md">
                    Unidades Tecnológicas de Santander
                </div>

                <div class="links">
                    <a href="graduados.jsp">Graduados</a>
                    <a href="/">Modalidades de grado</a>
                </div>
            </div>
        </div>
    </body>
</html>