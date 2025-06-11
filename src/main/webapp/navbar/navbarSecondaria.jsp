<div id="sticky" style="border-bottom: 2px solid #5F9EA0; padding-bottom: 5px;"> <%-- Aggiunto bordo inferiore e padding --%>
    <div id="content_btn2">
        <a href="javascript:void(0)" style="color: #66CCCC; font-size: 28px;">&#9660</a> <%-- Cambiato icona predefinita (da freccia su a freccia giù) e dimensione --%>
    </div>

    <nav class="bar2" style="background-color: #2F4F4F; border-radius: 8px; padding: 10px 0;"> <%-- Sfondo scuro, bordi arrotondati, padding interno --%>
        <ul>
            <li>
                <a id="scopri" href="${pageContext.request.contextPath}/index.html" style="font-weight: bold; text-transform: uppercase;">Scopri</a> <%-- Testo più evidente --%>
            </li>
            <li>
                <a id="esplora" href="${pageContext.request.contextPath}/sezioni/esplora.jsp" style="font-weight: bold; text-transform: uppercase;">Esplora</a>
            </li>
            <li>
                <a id="notizie" href="${pageContext.request.contextPath}/sezioni/notizie.jsp" style="font-weight: bold; text-transform: uppercase;">Notizie</a>
            </li>

            <% if (utente != null) { %>
            <li class="right" style="margin-right: 20px;"> <%-- Spazio extra a destra --%>
                <a id="libreria" href="${pageContext.request.contextPath}/libreria-servlet">Libreria</a>
            </li>
            <li class="right">
                <a id="carrello" href="${pageContext.request.contextPath}/MostraCarrelloServlet" style="color: #FFD700;">Carrello</a> <%-- Carrello evidenziato --%>
            </li>
            <% } %>

            <li style="order: -1; margin-left: 15px;"> <%-- Spostato l'elemento search all'inizio (o quasi) --%>
                <input id="searchBar" type="text" name="search" placeholder="Cerca giochi..." onkeyup="resulting()" style="border: 2px solid #40E0D0; border-radius: 20px; padding: 8px 15px; background-color: #1A1A1A; color: #F0F0F0;"> <%-- Bordo più spesso, arrotondato, colori invertiti --%>
                <div id="containerResult" style="background-color: #383838; border: 1px solid #5F9EA0; border-radius: 5px;"> <%-- Stile per i risultati della ricerca --%>
                    <%-- Qui verranno iniettati i risultati di ricerca --%>
                </div>
            </li>
        </ul>
    </nav>
</div>

<script>
        // Funzione che al click della freccia attiva lo slideToggle sulla navbar2
        $(document).ready(function (){
            $("#content_btn2 a").click(function (){
                $("nav.bar2").slideToggle(200, swap);
            });
        })

        // Funzione per cambiare l'icona della freccia e il padding
        function swap(){
            if($(".bar2").css("display") === "none"){
                $("#content_btn2 a").html("&#9660"); // Freccia giù quando nascosta
                $("#content_btn2 a").css({"padding-top":"3px", "color": "#66CCCC"});
            }
            else{
                $("#content_btn2 a").html("&#5121"); // Freccia su quando visibile
                $("#content_btn2 a").css({"padding-top":"0px", "color": "#66CCCC"});
            }
        }

        // Funzione ajax per la barra di ricerca
        function resulting(){
            let xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function (){
                if(xhttp.readyState === 4 && xhttp.status === 200){
                    var obj = this.responseText;
                    var x = JSON.parse(obj);
                    let list = document.getElementById("containerResult")

                    while(list.hasChildNodes()){
                        list.removeChild(list.firstChild);
                    }

                    for(var i=0; i<x["lista"].length; i++){
                        const a = document.createElement("a");
                        var path = "${pageContext.request.contextPath}/LoadPageProdottoServlet?titolo=" + x["lista"][i];
                        a.setAttribute("href", path);
                        a.innerHTML = x["lista"][i];
                        a.classList.add("resultSearch");
                        // Aggiunti stili in line per i risultati della ricerca per differenziarli
                        a.style.display = "block";
                        a.style.padding = "5px 10px";
                        a.style.color = "#E0FFFF";
                        a.style.textDecoration = "none";
                        a.style.borderBottom = "1px dotted #5F9EA0";
                        a.onmouseover = function() { this.style.backgroundColor = '#4A4A4A'; };
                        a.onmouseout = function() { this.style.backgroundColor = 'transparent'; };
                        document.getElementById("containerResult").appendChild(a);
                    }
                }
            }

            var text = document.getElementById("searchBar").value;
            xhttp.open("get", "${pageContext.request.contextPath}/resultSearchBar?testo=" + text, true);
            xhttp.send();
        }

</script>