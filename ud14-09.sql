Create database ud1409;
Use ud1409;

Drop table if exists Asignados_a;
Drop table if exists Cientificos;
Drop table if exists Proyecto;

create table Proyecto (
id char(4) not null,
nombre nvarchar(25),
horas int,
primary key (id)
);

Create table Cientificos (
dni varchar(8),
nombreApels varchar(255),
PRIMARY KEY (dni)
);

Create table Asignados_a(
cientifico varchar(8),
proyecto char(4),
primary key (cientifico , proyecto),
constraint fk_dniCientifico FOREIGN KEY (cientifico) 
REFERENCES Cientificos (dni)
ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_idProyecto FOREIGN KEY (proyecto) 
REFERENCES Proyecto (id)
ON DELETE CASCADE ON UPDATE CASCADE);

#INSERTS

Insert into Proyecto values
('PE01','Estados de la materia', 12),
('PE02','ADN vegetal',8),
('PE03','Electromagentismo',22),
('PE04','Estructura vegetal',12),
('PE05','Presion atmosferica',14),
('PE06','Flotabilidad',4),
('PE07','Masa y volumen', 8),
('PE08','Tension superficial',10),
('PE09','Acido acetico',4),
('PE10','Teoria cinetica',10);

Insert into Cientificos values
('3023634Y', 'Cintia Mañas'),
('8116451M', 'Mihai Piñero'),
('9069295K', 'Sara Dominguez'),
('4269094R', 'Juan Sans'),
('6639741E', 'Brigida Herreros'),
('9889070Y', 'Elisenda Hermida'),
('7403831M', 'Lina Santos'),
('1686069Q', 'Salvadora Chaparro'),
('7453884S', 'Ursula Fonseca'),
('9837593E', 'Bartolome Marcos');

Insert into Asignados_a values
('4269094R','PE01'),
('3023634Y','PE01'),
('8116451M','PE05'),
('6639741E','PE05'),
('9889070Y','PE08'),
('9069295K','PE09'),
('7453884S','PE09'),
('7403831M','PE03'),
('9837593E','PE03'),
('1686069Q','PE03');

Select * from Cientificos;
Select * from Proyecto;
Select * from Asignados_a;
