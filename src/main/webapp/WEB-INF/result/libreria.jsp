<%@ page import="Model.Utente" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Gioco" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/activeNavbar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generic.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar2.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">

    <style>

        section{
            position: relative;
            text-align: center;
            margin-left: 180;
            margin-right: 180px;
        }

        table{
            border-collapse: collapse;
            table-layout: fixed;
            background-color: #aa4c4c;
            margin-top: 40px;
            width: 100%;
        }

        td{
            padding: 8px;
            text-align: center;
            color: white;
            border-bottom: 0px;
            margin-bottom: 0px;
        }

        tr:hover {
            background-color: #2388cc;
        }

        .copertine {
            max-width: 100px;
            max-height: 200px;
            width: 100%;
        }

        .copertine:hover {
            cursor: pointer;
        }

        form{
            margin: 0;
        }

        p#vuoto{
            text-align: center;
            margin-top: 40px;
            font-size: 22px;
        }

        @media screen and (max-width: 1150px){

            .container{
                margin-right: 0px;
                margin-left: 0px;
            }
        }

        @media screen and (max-width: 1200px) and (min-width: 1151px){

           .container{
                margin-right: 114px;
                margin-left: 114px;
            }
        }

        @media screen and (max-width:700px){

            .copertine {
                max-width: 100px;
                max-height: 100px;
                width: 100%;
            }

            p#vuoto{
                font-size: 18px;
            }

            h1{
                font-size: 20px;
            }

        }

    </style>
</head>

<body onload="activeNavBarOnLoad()" style="min-height: 100vh; display: flex; flex-direction: column;">

<% Utente utente = (Utente) session.getAttribute("utente");
   List<String> libreriaUtente = utente.getLibreria();
   Map<String, Gioco> listaGiochiApplication = (Map<String, Gioco>) application.getAttribute("listaGiochi");
%>

<header>
    <%@include file="/navbar/navbarPrincipale.jsp"%>
</header>

<br>

<%@include file="/navbar/navbarSecondaria.jsp"%>

<br>

    <h1> La mia libreria </h1>

    <br>

    <div style="flex-grow: 1">

        <section class="container" style="margin-top: 50px">


    </section>
</div>

<br>

<footer>
    <%@include file="/navbar/footer.jsp"%>
</footer>

</body>
</html>