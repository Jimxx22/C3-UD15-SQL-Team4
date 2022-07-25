Create database ud1211;

Use ud1211;

Drop table if exists PasarPor;
Drop table if exists Estar;
Drop table if exists Localidad;
Drop table if exists Rio;
Drop table if exists Montana;
Drop table if exists Lago;
Drop table if exists Accidente;
Drop table if exists Pais;

Create table Pais(
id int auto_increment not null,
nombre varchar(40),
extension int,
poblacion int,
PRIMARY KEY (id)
);

Create table Accidente(
 id int auto_increment not null,
pHorizontal  double(10,4),
pVertical double,
nombre varchar(30),
PRIMARY KEY (id)
);

Create table Lago ( 
id int,
longitud double(10,4),
primary key(id),
foreign key(id)
references Accidente(id)
on delete cascade on update cascade);

Create table Montana ( 
id int,
altura double(10,4),
primary key(id),
foreign key(id)
references Accidente(id)
on delete cascade on update cascade);

Create table Rio ( 
id int,
longitud double(10,4),
primary key(id),
foreign key(id)
references Accidente(id)
on delete cascade on update cascade);

Create table Localidad(
id int auto_increment not null,
nombre varchar(50),
primary key (id));

Create table Estar(
id int auto_increment not null,
idAccidente int,
idPais int,
primary key (id),
foreign key(idAccidente) 
references Accidente(id)
on delete cascade on update cascade,
foreign key(idPais) 
references Pais(id)
on delete cascade on update cascade);

Create table PasarPor(
id int auto_increment not null,
idRio int,
idLocalidad int,
primary key (id),
foreign key(idRio) 
references Rio(id)
on delete cascade on update cascade,
foreign key(idLocalidad) 
references Localidad(id)
on delete cascade on update cascade);

#INSERTS

Insert into Accidente(pHorizontal, pVertical, nombre) values 
(-2.868942041372409, -57.99080645474104, 'Rio Amazonas'),
(24.006859131728476, 32.85947297692054, 'Rio Nilo'),
(29.72100842790423, 112.65001233703693, 'Rio Yangtsé'),
(33.650172958082635, -91.17961387237662, 'Rio Misisipi'),
(61.229886524670675, 89.56245323770314, 'Rio Yeniséi'),

(44.07546385873767, -86.97823564327572, 'Lago Michigan'),
(44.79421907569975, -82.47209754548975, 'Lago Huron'),
(-0.7053975400378573, 33.131141873442175, 'Lago Victoria'),
(45.16235716425056, 10.776242988759712, 'Lago Superior'),
(42.85547690296441, 50.33811198594954, 'Mar Caspio'),

(27.74098655838611, 87.15004299161608, 'Makalu'),
(27.962707814760957, 86.93361286774808, 'Lhotse'),
(27.7033643099906, 88.147577982227, 'Kanchenjunga'),
(35.88054271837648, 76.5151001566199, 'K2'),
(27.98868803467646, 86.92506097392403, 'Everest');

Insert into Lago values
(6, 57750),
(7, 59596),
(8, 69485),
(9, 82414),
(10, 371000);

Insert into Rio values 
(1, 7062),
(2, 6853),
(3, 6300),
(4, 6275),
(5, 5539);

Insert into Montana values
(11, 8485),
(12, 8516),
(13, 8586),
(14, 8611),
(15, 8848);

Insert into Pais (nombre,extension,poblacion) values
('Bolivia', 		1099000, 11000000),
('Brasil',		8516000, 212000000),
('Egipto',		1000000, 100000000),
('Tanzania',		947303,   63852892),
('Estados Unidos',	9833520, 331893745),
('Kenia',		580367,   54985698),
('Canada',		9984670, 38654738),
('China', 		9597000, 1411000),
('Nepal',		147516,   30034989);

Insert into Estar (idAccidente, idPais) values
(1,1),
(1,2),
(2,3),
(2,4),
(6,5),
(7,5),
(7,7),
(8,4),
(8,6),
(11,8),
(11,9);

insert into Localidad (nombre) values ('Nueva Orleans'),
('Manaus'),
('Cairo'),
('Shanghai'),
('Krasnoyarsk'),
('Wuhan'),
('St. Louis'),
('Memphis'),
('Alejandría'),
('Nanjing'),
('Jartum'),
('Yuba'),
('Macapá');

insert into PasarPor (idRio, idLocalidad) values (1,2),
(1, 13),
(2, 3),
(2, 9),
(2, 11),
(2, 12),
(3, 4),
(3, 6),
(3, 10),
(4, 1),
(4, 7),
(4, 8),
(5, 5);

Select * from Pais;
Select * from Accidente;
Select * from Lago;
Select * from Montana;
Select * from Rio;
Select * from Localidad;
Select * from Estar;
Select * from PasarPor;