drop database if exists GameVibe;
create database GameVibe;
use GameVibe;

create table Utente(
	email varchar(30) primary key,
    password text not null,
    username varchar(25) unique not null,
    nome varchar(30) not null,
    cognome varchar(20) not null,
    ddn date not null,
    nazione varchar(15) not null,
    ammin boolean not null
);


create table Gioco(
	titolo varchar(20) primary key,
    genere varchar(15) not null,
    offerta boolean not null,
    prezzo double not null,
    dataUscita date not null,
    contatoreRilevanze integer not null,
	descrizione text not null
);


create table ImagesGioco(
	id integer auto_increment primary key,
	titoloGioco varchar(20),
    pathImages text,
    foreign key(titoloGioco) references Gioco(titolo) on update cascade on delete cascade
);
    

create table CartaCredito(
    numeroCarta char(19),
    via varchar(30) not null,
    cap int(5) not null,
    citta varchar(20) not null,
    emailUtente varchar(30) not null,
    circuito varchar(20) not null,
    dataScadenza char(8) not null,
    foreign key (emailUtente) references Utente(email) on update cascade on delete cascade,
    primary Key(numeroCarta, emailUtente)
);

create table Carrello(
    id integer primary key auto_increment,
    totaleCarrello double not null,
    emailUtente varchar(30) not null,
	foreign key (emailUtente) references Utente(email) on update cascade on delete cascade
);	

create table RegistrareGiocoCarrello(
	titoloGioco varchar(20),
    idCarrello integer,
    primary key(titoloGioco, idCarrello),
    foreign key (titoloGioco) references Gioco(titolo) on update cascade on delete cascade,
    foreign key (idCarrello) references Carrello(id) on update cascade on delete cascade
);

create table Ordine(
    id integer primary key auto_increment,
    dataAcquisto date not null,
    totaleOrdine double not null,
    emailUtente varchar(30) not null,
    numeroCarta char(19),
    foreign key (emailUtente) references Utente(email) on update cascade on delete cascade,
    foreign key (numeroCarta) references CartaCredito(numeroCarta) on update cascade on delete cascade
);

create table AcquistoGiocoOrdine(
    idOrdine integer,
    titoloGioco varchar(20),
    prezzoAcquisto double not null,
    primary key(idOrdine, titoloGioco),
    foreign key(idOrdine) references Ordine(id) on update cascade on delete cascade,
    foreign key(titoloGioco) references Gioco(titolo) on update cascade on delete cascade
);

Insert into Gioco VALUES 
//Da fare

Insert into ImagesGioco (titoloGioco, pathImages) values 
//da fare

