<%@ page import="Model.Utente" %>
<%@ page import="Model.Gioco" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.Utente" %>
<%@ page import="Model.Carrello" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <%--${pageContext.request.contextPath} permette di ottenere mediante l'oggetto implicito pageContext, la relativa request,
        da cui poi si ottiene il percorso del contesto dell'applicazione, ovvero '/GameVibe' --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GameVibe</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/activeNavbar.js"></script>
    <script defer src="${pageContext.request.contextPath}/script/home.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generic.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar1.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar2.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" type="text/css">
</head>
<body onload="activeNavBarOnLoad()">

<% Utente utente = (Utente) session.getAttribute("utente");
    Carrello carrello = null;
    List<String> listaTitoliGiochiCarrello = null;
    List<String> libreriaUtente = null;
    if(utente!=null){
        carrello = utente.getCarrello();
        listaTitoliGiochiCarrello = carrello.getListaTitoliGiochiCarrello();
        libreriaUtente = utente.getLibreria();
    }%>

    <header>
        <%@include file="/navbar/navbarPrincipale.jsp"%>
    </header>

    <br>

    <%@include file="/navbar/navbarSecondaria.jsp"%>

    <section class="content">
        <br>

        <img id="content" src="${pageContext.request.contextPath}/images/EldenRing/screen.jpg">

        <div id="pallini">
            <input type="radio" id="img1" name="screen" checked>
            <input type="radio" id="img2" name="screen">
            <input type="radio" id="img3" name="screen">
        </div>

            <% Map<String, Gioco> listaGiochiApplication =  (Map<String, Gioco>) application.getAttribute("listaGiochi");
               List<String> listaGiochiOfferta = (List<String>) request.getAttribute("listaGiochiOfferta");
               List<String> listaGiochiDataUscita = (List<String>) request.getAttribute("listaGiochiDataUscita");
               List<String> listaGiochiRilevanti = (List<String>) request.getAttribute("listaGiochiRilevanti");
            %>

            <br>
            <p class="titoli">GIOCHI IN OFFERTA</p>
            <div class="centralCopertine">
                <%for(String titolo: listaGiochiOfferta){                   //itera sui titoli dei giochi della lista dei giochi in offerta recuperata dal DB
                    if(listaGiochiApplication.containsKey(titolo)){         //se la mappa salvata nell'application contiene la chiave titolo allora è un gioco in offerta e lo presento.
                        Gioco gioco = listaGiochiApplication.get(titolo);   //recupero il gioco dalla mappa
                        for(String path: gioco.getPathImages())             //itera sulla lista di path del Gioco (copertine, screen, video...)
                            if(path.contains("copertina")) {                //se la path contiene la sottostringa copertina %>

                                    <div class="containerCopertine">
                                        <p class="titoloGioco"><%=gioco.getTitolo()%></p>
                                        <!--form che invia richiesta alla servlet di mostrare la pagina prodotto-->
                                        <form action="${pageContext.request.contextPath}/LoadPageProdottoServlet" method="post">
                                            <input type="hidden" name="titolo" value="<%=gioco.getTitolo()%>">
                                            <input type="image" class="copertine" src="${pageContext.request.contextPath}/<%=path%>">
                                        </form>
                                        <p class="titoloGioco"><%=gioco.getPrezzo() + "€"%></p>

                                            <%if(utente!=null){%>
                                                <div style="position: relative; display: inline-block">

                                                    <% if(libreriaUtente.contains(titolo)) { %>

                                                        <img src="${pageContext.request.contextPath}/images/icon/OK.png" style="width: 30px; height: 30px;" class="tooltip">
                                                        <span class="tool">Gioco in libreria</span>

                                                    <% } else { %>

                                                    <!--input che al click invia richiesta ajax di aggiunta/rimozione di un gioco al carrello mediante l'icona apposita -->
                                                        <input type="image" class="<%=gioco.getTitolo()%> tooltip"
                                                                 <% Boolean flag = false;

                                                                    if(listaTitoliGiochiCarrello.contains(gioco.getTitolo())) {%>
                                                                    src="${pageContext.request.contextPath}/images/icon/ListaMeno.png"
                                                                    <% flag = true;
                                                                    }
                                                                    else { %>
                                                                    src="${pageContext.request.contextPath}/images/icon/ListaPiu.png"
                                                                <% } %>

                                                                style="width: 30px; height: 30px;" onclick="aggiungiCarrello('<%=gioco.getTitolo()%>')">
                                                                <% if(flag == true) { %>
                                                                <span class="tool <%=gioco.getTitolo()%>tool">Rimuovi dal carrello</span>
                                                                <%  } else { %>
                                                                <span class="tool <%=gioco.getTitolo()%>tool">Aggiungi al carrello</span>
                                                                <%  }
                                                            }%>

                                                </div>
                                            <%} else {
                                                        %>
                                                    <div style="position: relative; display: inline-block">
                                                        <form action="${pageContext.request.contextPath}/accesso/login.jsp" class="tooltip">
                                                            <input type="image" src="${pageContext.request.contextPath}/images/icon/ListaPiu.png" style="width: 30px; height: 30px;">
                                                            <span class="tool">Aggiungi al carrello</span>
                                                        </form>
                                                    </div>
                                            <% } %>
                                    </div>
                            <% }
                    }
                }
                %>
            </div>

            <br><br>


            <br><br>
            <p class="titoli">GIOCHI RILEVANTI</p>
            <div class="centralCopertine">
                <%for(String titolo: listaGiochiRilevanti){                //itera sui titoli dei giochi della lista dei giochi in offerta recuperata dal DB
                    if(listaGiochiApplication.containsKey(titolo)){        //se la mappa salvata nell'application contiene la chiave titolo allora è un gioco in offerta e lo presento.
                        Gioco gioco = listaGiochiApplication.get(titolo);  //recupero il gioco dalla mappa
                        for(String path: gioco.getPathImages())            //itera sulla lista di path del Gioco (copertine, screen, video...)
                            if(path.contains("copertina")) {               //se la path contiene la sottostringa copertina %>

                                <div class="containerCopertine">
                                    <p class="titoloGioco"><%=gioco.getTitolo()%></p>
                                    <!--form che invia richiesta alla servlet di mostrare la pagina prodotto-->
                                    <form action="${pageContext.request.contextPath}/LoadPageProdottoServlet" method="post">
                                        <input type="hidden" name="titolo" value="<%=gioco.getTitolo()%>">
                                        <input type="image" class="copertine" src="${pageContext.request.contextPath}/<%=path%>">
                                    </form>
                                    <p class="titoloGioco"><%=gioco.getPrezzo() + "€"%></p>

                                    <%if(utente!=null){%>

                                    <div style="position: relative; display: inline-block">

                                        <% if(libreriaUtente.contains(titolo)) { %>

                                            <img src="${pageContext.request.contextPath}/images/icon/OK.png" style="width: 30px; height: 30px;" class="tooltip">
                                            <span class="tool">Gioco in libreria</span>

                                        <% } else { %>

                                        <!--input che al click invia richiesta ajax di aggiunta/rimozione di un gioco al carrello mediante l'icona apposita -->
                                            <input type="image" class="<%=gioco.getTitolo()%> tooltip"
                                                <%  Boolean flag = false;
                                                    if(listaTitoliGiochiCarrello.contains(gioco.getTitolo())) {%>
                                                        src="${pageContext.request.contextPath}/images/icon/ListaMeno.png"
                                                        <% flag = true;
                                                    }
                                                    else { %>
                                                        src="${pageContext.request.contextPath}/images/icon/ListaPiu.png"
                                                <% } %>

                                                   style="width: 30px; height: 30px;" onclick="aggiungiCarrello('<%=gioco.getTitolo()%>')">

                                            <% if(flag == true) { %>
                                            <span class="tool <%=gioco.getTitolo()%>tool">Rimuovi dal carrello</span>
                                            <%  } else { %>
                                            <span class="tool <%=gioco.getTitolo()%>tool">Aggiungi al carrello</span>
                                            <%  }
                                            }%>
                                    </div>
                                    <%} else {
                                    %>
                                    <div style="position: relative; display: inline-block">
                                        <form action="${pageContext.request.contextPath}/accesso/login.jsp" class="tooltip">
                                            <input type="image" src="${pageContext.request.contextPath}/images/icon/ListaPiu.png" style="width: 30px; height: 30px;">
                                            <span class="tool">Aggiungi al carrello</span>
                                        </form>
                                    </div>
                                    <% } %>
                                </div>
                            <% }
                    }
                }
                %>
            </div>

            <br><br>
            <p class="titoli">TUTTI I GIOCHI</p>
                <div class="centralCopertine">
                    <% for(Gioco gioco: listaGiochiApplication.values()){ %>
                            <%for(String path: gioco.getPathImages())
                                if(path.contains("copertina")) { %>
                                    <div class="containerCopertine">
                                        <p class="titoloGioco"><%=gioco.getTitolo()%></p>
                                        <!--form che invia richiesta alla servlet di mostrare la pagina prodotto-->
                                        <form action="${pageContext.request.contextPath}/LoadPageProdottoServlet" method="post">
                                            <input type="hidden" name="titolo" value="<%=gioco.getTitolo()%>">
                                            <input type="image" class="copertine" src="${pageContext.request.contextPath}/<%=path%>">
                                        </form>
                                        <p class="titoloGioco"><%=gioco.getPrezzo() + "€"%></p>

                                        <%if(utente!=null){%>
                                        <div style="position: relative; display: inline-block">

                                            <% if(libreriaUtente.contains(gioco.getTitolo())) { %>

                                                    <img src="${pageContext.request.contextPath}/images/icon/OK.png" style="width: 30px; height: 30px;" class="tooltip">
                                                    <span class="tool">Gioco in libreria</span>

                                            <% } else { %>

                                                <!--input che al click invia richiesta ajax di aggiunta/rimozione di un gioco al carrello mediante l'icona apposita -->
                                                    <input type="image" class="<%=gioco.getTitolo()%> tooltip"
                                                        <%  Boolean flag = false;
                                                            if(listaTitoliGiochiCarrello.contains(gioco.getTitolo())) {%>
                                                            src="${pageContext.request.contextPath}/images/icon/ListaMeno.png"
                                                            <% flag = true;
                                                        }
                                                            else { %>
                                                           src="${pageContext.request.contextPath}/images/icon/ListaPiu.png"
                                                        <% } %>

                                                           style="width: 30px; height: 30px;" onclick="aggiungiCarrello('<%=gioco.getTitolo()%>')">

                                                <% if(flag == true) { %>
                                                    <span class="tool <%=gioco.getTitolo()%>tool">Rimuovi dal carrello</span>
                                                    <%  } else { %>
                                                    <span class="tool <%=gioco.getTitolo()%>tool">Aggiungi al carrello</span>
                                                    <%  }
                                                    }%>
                                        </div>
                                        <%} else {
                                                %>
                                                <div style="position: relative; display: inline-block">
                                                    <form action="${pageContext.request.contextPath}/accesso/login.jsp" class="tooltip">
                                                        <input type="image" src="${pageContext.request.contextPath}/images/icon/ListaPiu.png" style="width: 30px; height: 30px;">
                                                        <span class="tool">Aggiungi al carrello</span>
                                                    </form>
                                                </div>
                                        <% } %>
                                    </div>
                             <% }
                    } %>
                </div>
    </section>

    <br>

    <footer>
        <%@include file="/navbar/footer.jsp"%>
    </footer>

    <script>

       
    </script>

</body>
</html>
