//funzione chiamata nel momento in cui la pagina è stata caricata, si occupa di prelevare dall'oggetto window il pathname
//della pagina in cui si trova l'utente, in base a dove si trova setta la classe active ad un elemento specifico della navbar1
//e della navbar2
function activeNavBarOnLoad(){
    let x = window.location.pathname;
//alcune implementazioni sono messe ma implementate dopo
    if(x === "/GameVibe/index.html") {
        document.getElementById("home").classList.add("active");
        document.getElementById("scopri").classList.add("active2");     //si rimuove con remove()
    }
    else if(x === "/GameVibe/sezioni/esplora.jsp"){
        document.getElementById("home").classList.add("active");
        document.getElementById("esplora").classList.add("active2");
    }
    else if(x === "/GameVibe/sezioni/notizie.jsp") {
        document.getElementById("home").classList.add("active");
        document.getElementById("notizie").classList.add("active2");
    }
    else if(x === "/GameVibe/accesso/login.jsp"){
        document.getElementById("accedi").classList.add("active");
    }
    else if(x === "/GameVibe/MostraCarrelloServlet"){
        document.getElementById("carrello").classList.add("active2");
        document.getElementById("home").classList.add("active");
    }
    else if(x === "/GameVibe/libreria-servlet"){
        document.getElementById("libreria").classList.add("active2");
        document.getElementById("home").classList.add("active");
    }
    else if(x === "/GameVibe/LoadPageUserServlet"){
        document.getElementById("profilo").classList.add("active");
    }
    else if(x === "/GameVibe/LoadPageProdottoServlet"){
        document.getElementById("home").classList.add("active");
    }
    else if(x === "/GameVibe/accesso/registrati.jsp"){
        document.getElementById("accedi").classList.add("active");
    }
    else if(x === "/GameVibe/sezioni/info.jsp"){
        document.getElementById("info").classList.add("active");
    }
    else if(x === "/GameVibe/sezioni/assistenza.jsp"){
        document.getElementById("assistenza").classList.add("active");
    }
}