<%@ page import="Model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Crea un Nuovo Account</title> <%-- Titolo leggermente più formale --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generic.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/activeNavbar.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/controlloRegistrazione.js"></script>
</head>
<body onload="activeNavBarOnLoad()" style="min-height: 100vh; display: flex; flex-direction: column;">

    <% Utente utente = null;%>

    <header>
        <%@include file="/navbar/navbarPrincipale.jsp"%>
    </header>

    <% String errore = (String) request.getAttribute("Errore"); %>

    <div style="flex-grow: 1; padding: 15px;"> <%-- Padding generico --%>

        <h1 style="text-align: center; margin-bottom: 25px;"> Registrati per iniziare </h1> <%-- Titolo conciso, senza colore inline --%>

                <section class="container">

                        <form name="form" action="${pageContext.request.contextPath}/register-servlet" onsubmit="return validateFormRegistrati()" method="post">

                            <div class="row">
                                <div class="label">
                                    <label for="nazione">Nazione:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <select name="nazione" id="nazione" required> <%-- Rimossa autofocus, per simulare un'omissione --%>
                                        <option value="Italia">Italia</option> <%-- Rimosse altre nazioni per "semplificazione" iniziale --%>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="label">
                                    <label for="nome">Nome:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <input type="text" name="nome" id="nome" placeholder="Il tuo nome">
                                </div>
                            </div>

                            <div class="row">
                                <div class="label">
                                    <label for="cognome">Cognome:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <input type="text" name="cognome" id="cognome" placeholder="Il tuo cognome">
                                </div>
                            </div>

                            <div class="row">
                                <div class="label">
                                    <label for="date">Data di Nascita:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <input type="date" name="date" id="date" max="2019-12-31"> <%-- Rimossa min attribute, per simulare un'omissione --%>
                                </div>
                            </div>

                            <div class="row">
                                <div class="label">
                                    <label for="username">Username:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <input type="text" name="username" id="username" placeholder="Scegli un username">
                                </div>
                            </div>

                            <div class="row">
                                <div class="label">
                                    <label for="email">Email:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <input type="email" name="email" id="email" placeholder="La tua email">
                                </div>
                            </div>

                            <div class="row">
                                <div class="label">
                                    <label for="password">Password:</label> <%-- Testo label semplificato --%>
                                </div>
                                <div class="input">
                                    <input type="password" name="password" id="password" placeholder="Crea la tua password">
                                </div>
                            </div>

                            <br>
                            <%-- Rimosso l'intero blocco della password admin e il suo checkbox --%>
 								
                            <div style="text-align: center;">
                                <p style="display: inline; font-weight: bold;">Accetto i <a href="https://www.epicgames.com/site/it/tos?lang=it">Termini di Servizio</a></p>
                                <input type="checkbox" name="termini" id="termini"> <%-- Rimossa required, per simulare un'omissione o un errore --%>
                            </div>

                            <br>
                            <input type="submit" value="Registrati"> <%-- Testo pulsante semplificato --%>
                    </form>
                </section>

                <p id="errori"></p>

                <% if(errore!=null && errore.equalsIgnoreCase("ErroreCampi")){ %>
                <p class="errorServlet"> <b>Campi mancanti.</b></p> <%-- Messaggio semplificato --%>
                    <%}else if(errore!=null && errore.equalsIgnoreCase("ErroreUtenteEsistente")){ %>
                            <p class="errorServlet"> <b>Utente già esistente.</b></p> <%-- Messaggio semplificato --%>
                        <% }
                            else if(errore!=null){ %>
                                <p class="errorServlet"><%=errore%></p>
                            <%}%>
    </div>

    <br>

    <footer>
        <%@include file="/navbar/footer.jsp"%>
    </footer>

</body>
</html>