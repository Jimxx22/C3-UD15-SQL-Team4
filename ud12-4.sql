create database ud1204;
use ud1204;

Drop table if exists Pertenecer;
Drop table if exists Combatir;
Drop table if exists Independencia;
Drop table if exists Bando;
Drop table if exists Guerra;
Drop table if exists Pais;

create table Guerra (id int auto_increment not null, 
nombre varchar(50), 
fecha_in date not null, 
fecha_fin date,
primary key (id));

create table Bando (id int auto_increment not null, 
nombre varchar(100),
ganador boolean, 
primary key (id));

create table Pais (id int auto_increment not null, 
nombre varchar(50), 
primary key (id));

create table Independencia (id int auto_increment not null, 
fecha_in date not null, 
fecha_fin date, 
idPais int not null,
primary key (id),
foreign key(idPais) 
references Pais(id)
on delete cascade on update cascade);

create table Combatir (id int auto_increment not null, 
primary key (id),
idGuerra int not null,
idBando int not null,
foreign key(idGuerra) 
references Guerra(id)
on delete cascade on update cascade,
foreign key(idbando) 
references Bando(id)
on delete cascade on update cascade);

create table Pertenecer (id int auto_increment not null, 
fecha_en date,
fecha_sal date,
idBando int not null,
idPais int not null,
primary key (id),
foreign key(idBando) 
references Bando(id)
on delete cascade on update cascade,
foreign key(idPais) 
references Pais(id)
on delete cascade on update cascade);

#INSERTS

Insert into Guerra (nombre, fecha_in, fecha_fin) values
('1ª Guerra Mundial','1914-01-01', '1918-01-01'),
('2ª Guerra Mundial','1939-01-01', '1945-01-01'),
('Guerra civil Española','1936-01-01', '1939-01-01');


Insert into Bando (nombre,ganador) values 
('Potencias del Entente', 1),
('Potencias Centrales',0),
('El Eje', 0),
('Los Aliados', 1),
('Bando republicano', 0),
('Bando nacional', 1);


Insert into Pais (nombre) values ('Estados Unidos de América');
Insert into Pais (nombre) values ('Alemania');
Insert into Pais (nombre) values ('Japón');
Insert into Pais (nombre) values ('Unión Soviética');
Insert into Pais (nombre) values ('Francia');
Insert into Pais (nombre) values ('Austria-Hungría');
Insert into Pais (nombre) values ('Italia');
Insert into Pais (nombre) values ('Reino Unido');
Insert into Pais (nombre) values ('Turquía Otomana');
Insert into Pais (nombre) values ('España');

Insert into Pertenecer (fecha_en,fecha_sal, idBando, idPais) values
('1937-01-01', '1939-01-01',4,1),
('1936-07-01', '1939-01-01',5,10),
('1936-07-01', '1939-01-01',6,10),
('1914-04-01', '1918-01-01',2,2),
('1914-04-01', '1918-01-01',2,9),
('1914-04-01', '1918-01-01',1,5);

Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1776-01-01', NULL, 1);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1867-01-01', '1945-01-01', 2);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1949-01-01', NULL, 2);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('674-01-01', NULL, 3);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1917-01-01', '1991-01-01', 4);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('563-01-01', NULL, 5);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1623-01-01', '1918-01-01', 6);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1858-01-01', NULL, 7);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1741-01-01', NULL, 8);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1263-01-01', '1922-01-01', 9);
Insert into Independencia (fecha_in, fecha_fin, idPais) values ('1516-01-01', NULL, 10);

Insert into Combatir (idGuerra, idBando) values 
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6);

select * from Guerra;
select * from Bando;
select * from Pais;
select * from Independencia;
select * from Combatir;
select * from Pertenecer;

