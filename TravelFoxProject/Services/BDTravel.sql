USE master
IF EXISTS(SELECT * FROM sys.databases WHERE name='TravelFox')
DROP DATABASE TravelFox

CREATE DATABASE TravelFox

USE TravelFox

CREATE TABLE Detalle_Usuario(
idDetUsu int primary key identity(1,1),
nomUsu varchar(40) NOT NULL,
apeUsu varchar(40) NOT NULL,
emailUsu varchar(50) NOT NULL,
dniUsu char(8) NOT NULL,
fechaNacUsu date NOT NULL);

CREATE TABLE Usuario(
idUsuario int primary key identity(1,1),
username varchar(15) NOT NULL,
password varchar(20)NOT NULL,
idDetUsu int foreign key references Detalle_Usuario);

CREATE TABLE Ruta(
idRuta int primary key identity(1,1) ,
inicioRuta varchar(40) NOT NULL,
finalRuta varchar(40) NOT NULL);


create table Transporte(
idTransporte int primary key identity(1,1),
nroPlaca varchar(10) NOT NULL,
capacidad varchar(20) NOT NULL,
tipoTransporte varchar(20) NOT NULL,
idRuta int foreign key references Ruta(idRuta)
--codCompañia

)
create table Conductor(
idConductor  int primary key identity(1,1),
nombre varchar(20) NOT NULL,
apellido varchar(20) NOT NULL,
telefono int NOT NULL,
dni int NOT NULL,
fechaNac date NOT NULL)

create table TransporteConductor(
idTransporte int foreign key references Transporte (idTransporte),
idConductor int foreign key references Conductor(idConductor))
