<%@ page import="Model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="it">
<head>
    <title>Info</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/activeNavbar.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generic.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar2.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <style>

        section {
            margin-right: 214px;
            margin-left: 214px;
            text-align: center;
            margin-top: 150px;
        }

        img.logoCentrale {
            margin-top: 50px;
            max-width: 500px;
            max-height: 300px;
            width: 100%;
        }

        h2{
            font-size: 19px;
        }

        @media screen and (max-width: 700px){

            h1 {
                font-size: 18px;
            }

            h2{
                font-size: 16px !important;
            }

            img.logoCentrale{
                max-width: 300px;
                max-height: 200px;
            }
        }

        @media screen and (max-width: 1150px){

            section{
                margin-right: 0px;
                margin-left: 0px;
            }
        }

        @media screen and (max-width: 1400px) and (min-width: 1151px){

            section{
                margin-right: 114px;
                margin-left: 114px;
            }
        }

    </style>
</head>

<body onload="activeNavBarOnLoad()" style="min-height: 100vh; display: flex; flex-direction: column;">

    <% Utente utente = (Utente) session.getAttribute("utente");%>

    <header>
        <%@include file="/navbar/navbarPrincipale.jsp"%>
    </header>

    <br>

    <div style="flex-grow: 1">

        <section>

            <h1> GameVibe: Dove la Passione è Storia.</h1>
        <h2>
            Benvenuto su GameVibe!
            Qui la pura passione per il mondo dei videogiochi si traduce in un sogno: connettere milioni di 
            persone in tutto il mondo e permettere a chiunque di esplorare l'infinito universo videoludico. Su 
            GameVibe, ogni titolo è una nuova avventura che aspetta solo di essere scoperta, un portale 
            verso mondi inesplorati e sfide emozionanti.
            Ci impegniamo ogni giorno per offrirti non solo un vastissimo catalogo, ma anche un'esperienza 
            di acquisto e navigazione eccellente, fluida e intuitiva, pensata per i veri gamer. Che tu sia un 
            veterano o un neofita, qui troverai sempre qualcosa che ti appassiona.
            Buona permanenza su GameVibe: il tuo prossimo gioco ti aspetta, e l'avventura è appena 
            cominciata!
            
        </h2>

            <img class="logoCentrale" src="${pageContext.request.contextPath}/images/icon/logo_vibe1.png">
        </section>
    </div>

    <br>

    <footer>
        <%@include file="/navbar/footer.jsp"%>
    </footer>

</body>
</html>