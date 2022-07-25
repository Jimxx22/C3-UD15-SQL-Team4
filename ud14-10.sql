Create database ud1410;
Use ud1410;

Drop table if exists Venta;
Drop table if exists Cajeros;
Drop table if exists Productos;
Drop table if exists Maquinas_Registradoras;

Create table Cajeros(
codigo int auto_increment not null,
nomApels varchar(255),
Primary key(codigo)
);

Create table Maquinas_Registradoras(
codigo int auto_increment not null,
piso int,
Primary key(codigo)
);

Create table Productos(
codigo int auto_increment not null,
nombre varchar(100),
precio int,
Primary key(codigo)
);

create table Venta(
cajero int not null,
maquina int not null,
producto int not null,
primary key (cajero, maquina, producto),
constraint fk_cajero FOREIGN KEY (cajero) 
REFERENCES Cajeros (codigo)
ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_maquina FOREIGN KEY (maquina) 
REFERENCES Maquinas_Registradoras (codigo)
ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_producto FOREIGN KEY (producto) 
REFERENCES Productos (codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

#INSERTS

Insert into Cajeros (nomApels) values 
('Jonatan Falcon'),
('Maria-Fernanda Ripoll'),
('Rufina Laguna'),
('Bienvenida Bueno'),
('Covadonga Trujillo'),
('Maria-Esperanza Arana'),
('Ismael Mercado'),
('Triana Baez'),
('Maria-Josefa Segovia'),
('Hipolito Polo');

Insert into Maquinas_Registradoras (piso) values
(1),
(1),
(1),
(2),
(2),
(2),
(3),
(3),
(3),
(3);

Insert into Productos (nombre,precio) values
('Arroz',1),
('Tomate',2),
('Patatas fritas',1),
('Patatas congeladas',2),
('Nocilla',3),
('Chocolate Milka',2),
('Cereales',3),
('Zanahorias',1),
('Detergente',5),
('Leche',1);

Insert into Venta values 
(1,1,1),
(1,1,2),
(2,1,2),
(2,1,3),
(3,3,4),
(4,3,5),
(5,6,9),
(5,6,7),
(7,7,6),
(7,7,5);

Select * from Cajeros;
Select * from Maquinas_Registradoras;
Select * from Productos;
Select * from Venta;
