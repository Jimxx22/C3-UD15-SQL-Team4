create database ud1408;
use ud1408;

drop table if exists Piezas;
drop table if exists Proveedores;
drop table if exists Suministra;

create table Piezas(
codigo int auto_increment not null,
nombre varchar(100),
Primary key (codigo)
);

Create table Proveedores (
id char(4),
nombre varchar(100),
PRIMARY KEY (id)
);

create table Suministra (
codigoPieza int,
idProveedor char(4),
precio int,
primary key (codigoPieza, idProveedor),
constraint fk_codigoPieza FOREIGN KEY (codigoPieza  ) 
REFERENCES Piezas (codigo)
ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_codigoProveedores FOREIGN KEY (idProveedor) 
REFERENCES Proveedores (id)
ON DELETE CASCADE ON UPDATE CASCADE
);

#INSERTS

Insert into Proveedores values
('ACH2','Samsung'),
('JWD6','Qualcom'),
('LGCD','LG'),
('AS2D','Apple'),
('PO98','Oppo'),
('DWAS','Sony'),
('MXW1','Leica'),
('73J1','Huawei'),
('HS21','Xiaomi'),
('MNIW','AKG');

Insert into Piezas (nombre) values 
('Snapdragon 888+'),
('Snapdragon 888'),
('Pantalla iphone 12'),
('Camaras iphone 12'),
('Camara Leica'),
('Pantalla Huawei'),
('Altavoz Samsung'),
('Bateria LG'),
('Auriculares AKG'),
('Altavoz Sony'),
('Camara Xiaomi');

Insert into Suministra values
(1,'JWD6', 75),
(2, 'JWD6', 65),
(3, 'AS2D', 220),
(4, 'AS2D', 230),
(5, 'MXW1', 120),
(6, '73J1', 70),
(7, 'LGCD', 10),
(8, 'MNIW', 100),
(9, 'DWAS', 60),
(10, 'HS21', 40);

Select * from Proveedores;
Select * from Piezas;
Select * from Suministra;
