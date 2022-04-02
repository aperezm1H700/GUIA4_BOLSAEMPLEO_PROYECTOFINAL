CREATE DATABASE Cineplus;

USE Cineplus;

create TABLE Salas
(
	Id smallint auto_increment primary key,
    NumSala smallint not null,
    CanAsientos smallint not null,
    Id_Pelicula smallint not null,
    unique(NumSala),
    unique(Id_Pelicula),
    constraint fk_sala_peli foreign key (Id_Pelicula) references Peliculas(Id)
);
update salas set NumSala=10,CanAsientos=50,Id_Pelicula=9 WHERE Id=7;
SELECT Id,NumSala,Id_Pelicula FROM Salas WHERE Id_Pelicula = 4;
SELECT CanAsientos FROM Salas WHERE NumSala = 8;
SELECT * FROM Salas;
SELECT s.Id,s.NumSala,s.CanAsientos,p.NomPeli FROM Salas AS s INNER JOIN Peliculas AS p WHERE s.Id_Pelicula = p.Id;
SELECT p.NomPeli FROM Salas AS s INNER JOIN Peliculas AS p WHERE s.Id_Pelicula = p.Id;
SELECT s.Id,p.NomPeli,s.Id_Pelicula FROM Salas AS s INNER JOIN Peliculas AS p WHERE s.Id_Pelicula = p.Id;

UPDATE Salas SET CanASientos= (CanAsientos-1) WHERE Id=4;

create TABLE Peliculas
(
	Id smallint auto_increment primary key,
    NomPeli varchar(50) not null,
    HoraPeli varchar(5) not null,
    Duracion smallint not null,
    Idioma varchar(20) not null,
    Id_Clasificacion smallint not null,
    constraint fk_peli_clasi foreign key (Id_Clasificacion) references Clasificacion(Id)
);

SELECT * FROM Peliculas;
DELETE FROM Peliculas WHERE Id=10;

SELECT p.Id,p.NomPeli,p.HoraPeli,p.Duracion,p.Idioma,c.Clasificacion FROM Peliculas AS p 
INNER JOIN Clasificacion AS c WHERE p.Id_Clasificacion = c.Id;

CREATE TABLE Clasificacion
(
	Id smallint auto_increment primary key,
    Clasificacion VARCHAR(3)
);
SELECT * FROM Clasificacion;
INSERT INTO Clasificacion (Clasificacion) VALUES ('AA'),('A'),('B'),('B15'),('C'),('D');

create TABLE VentaBoletos
(
	Id smallint auto_increment primary key,
    NomPeli varchar(50) not null,
    NumSala smallint not null,
    NumAsiento smallint not null,
    Id_TipoBoletos smallint not null,
    TotalBoleto smallint not null,
    constraint fk_venta_tipobolero foreign key (Id_TipoBoletos) references TipoBoletos(Id)
);
select NomPeli,NumAsiento FROM VentaBoletos WHERE NomPeli='Judas' and NumAsiento = 29;

SELECT V.Id,V.NomPeli,V.NumSala,V.NumAsiento,T.TipoBoleto,V.TotalBoleto
FROM VentaBoletos AS V INNER JOIN TipoBoletos AS T 
WHERE V.Id_TipoBoletos = T.Id ;
select * from ventaboletos;

CREATE TABLE TipoBoletos
(
	Id smallint auto_increment primary key,
    TipoBoleto VARCHAR(20)
);
INSERT INTO TipoBoletos (TipoBoleto) VALUES ('Adulto'),('Niño'),('Tarjeta');
SELECT * FROM TipoBoletos;





