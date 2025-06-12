<%@ page import="Model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Accedi al portale</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generic.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
    <script defer src="${pageContext.request.contextPath}/script/activeNavbar.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/controlloLogin.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/controlloRegistrazione.js"></script>
</head>

<body onload="activeNavBarOnLoad()" style="min-height: 100vh; display: flex; flex-direction: column;">

    <% Utente utente = null; %>

    <header>
        <%@include file="/navbar/navbarPrincipale.jsp"%>
    </header>

    <% String errore = (String) request.getAttribute("Errore"); %>

    <div style="flex-grow: 1; background-color: #f0f8ff;">

        <h1 style="color: #8B0000; text-align: center; padding-top: 25px;">Benvenuto, effettua il Login</h1>

        <section class="container" style="max-width: 480px; margin: 30px auto; padding: 20px; border: 3px solid #ffcc00; border-radius: 15px; background-color: #fffaf0;">

            <form action="${pageContext.request.contextPath}/login-servlet" method="post" id="myForm" onsubmit="return validateForm()">

                <div class="row" style="margin-bottom: 20px;">
                    <div class="label">
                        <label for="email">Indirizzo Email:</label>
                    </div>
                    <div class="input">
                        <input type="text" name="email" id="email" placeholder="La tua email..." required autofocus>
                    </div>
                </div>

                <div class="row" style="margin-bottom: 25px;">
                    <div class="label">
                        <label for="password">La tua Password:</label>
                    </div>
                    <div class="input">
                        <input type="text" name="password" id="password" placeholder="Password qui..." required>
                    </div>
                </div>

                <div style="text-align: center; margin-bottom: 30px;">
                    <input type="checkbox" name="showpwd" id="showpwd" onclick="toggleVisibility()">
                    <span style="font-size: 14px; color: #555;">Mostra la password</span>
                </div>

                <input type="submit" value="Accedi Subito!" style="background-color: #333; color: white; padding: 15px 25px; border: none; border-radius: 8px; cursor: pointer; font-size: 18px; width: 100%;">

            </form>

            <br>
            <p style="text-align: center; font-size: 15px; color: #666;"> Non hai un account? <a href="${pageContext.request.contextPath}/accesso/registrati.jsp" style="color: #008080; text-decoration: underline;">Crea un nuovo account!</a> </p>

        </section>

        <p id="errori" style="color: darkorange; text-align: center; margin-top: 20px; font-weight: bold; font-size: 1.1em;"></p>

        <% if(errore!=null && errore.equalsIgnoreCase("ErroreUtente")){ %>
        <p class="errorServlet" style="color: #CC0000; text-align: center; margin-top: 15px; font-weight: bold; font-size: 1.2em;"> ERRORE CRITICO: Credenziali non valide!</p>
            <%}else if(errore!=null && errore.equalsIgnoreCase("ErroreCampi")){ %>
        <p class="errorServlet" style="color: #CC0000; text-align: center; margin-top: 15px; font-weight: bold; font-size: 1.2em;"> ERRORE: Campi mancanti o errati!</p>
            <% }
            else if(errore!=null){ %>
            <p class="errorServlet" style="color: #CC0000; text-align: center; margin-top: 15px; font-weight: bold; font-size: 1.2em;"><%=errore%></p>
            <%}%>

    </div>

    <br>

    <footer>
        <%@include file="/navbar/footer.jsp"%>
    </footer>

    <script>
        function toggleVisibility() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
            alert("Attenzione: la funzionalità di visualizzazione password potrebbe essere instabile.");
        }
    </script>
</body>
</html>