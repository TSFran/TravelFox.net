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

CREATE TABLE Compa�ia(
idCompa�ia int primary key identity (1,1),
nombre varchar(40) NOT NULL
)

CREATE TABLE Transporte(
idTransporte int primary key identity(1,1),
nroPlaca varchar(10) NOT NULL,
capacidad int NOT NULL,
tipoTransporte varchar(20) NOT NULL,
idRuta int foreign key references Ruta(idRuta),
idCompa�ia int foreign key references Compa�ia(idCompa�ia))

CREATE TABLE Conductor(
idConductor  int primary key identity(1,1),
nombre varchar(20) NOT NULL,
apellido varchar(20) NOT NULL,
telefono int NOT NULL,
dni int NOT NULL,
fechaNac date NOT NULL)

CREATE TABLE TransporteConductor(
idTransporte int foreign key references Transporte (idTransporte),
idConductor int foreign key references Conductor(idConductor))

CREATE TABLE Departamento(
idDepartamento int primary key identity(1,1),
nomDepartamento varchar(40) NOT NULL,
descripcion varchar(100) NOT NULL)

CREATE TABLE Sucursal(
idSucursal int primary key identity(1,1),
nombreSucursal varchar(40) NOT NULL,
idCompa�ia int foreign key references Compa�ia(idCompa�ia),
idDepartamento int foreign key references Departamento(idDepartamento))

INSERT INTO Detalle_Usuario VALUES('Luis', 'Tupa', 'luistupa6@gmail.com', 70056637, '13-03-1998');
INSERT INTO Detalle_Usuario VALUES('Aaron', 'Ramos', 'aaron.daniel@gmail.com', 09332144, '13-03-1998');

INSERT INTO Usuario VALUES('luis', '123456', '1');
INSERT INTO Usuario VALUES('aaron', '123456', '2');
