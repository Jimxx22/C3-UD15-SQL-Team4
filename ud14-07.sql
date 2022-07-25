create database ud1407;
use ud1407;

drop table if exists Directores;
drop table if exists Despachos;

create table Despachos (
numero int not null,
capacidad int,
primary key (numero)
);

Create table Directores(
dni varchar(8),
nomApels varchar(255),
dniJefe varchar(8),
despacho int,
primary key(dni),
constraint fk_numeroDespacho FOREIGN KEY (despacho  ) 
REFERENCES Despachos (numero)
ON DELETE CASCADE ON UPDATE CASCADE
);

Alter table Directores add constraint fk_dniJefeDirectores FOREIGN KEY (dniJefe) 
REFERENCES Directores(dni)
ON DELETE CASCADE ON UPDATE CASCADE;

#INSERTS

Insert into Despachos values
(101, 25),
(102, 12),
(103, 4),
(104, 4),
(105, 1),
(106, 2),
(107, 14),
(108, 12),
(109, 25),
(110, 8);

Insert into Directores values 
('2028643T', 'Arancha Toledo', NULL, 105),
('4485261V', 'Juan Mayoral', '2028643T', 101),
('6588740L', 'Hajar Rosa', '2028643T', 102),
('1413828R', 'Miriam Urbano', '2028643T', 103),
('3030479K', 'Eduardo Gordillo', '2028643T', 104),
('0987192K', 'Dunia Ojeda', '2028643T', 106),
('8438266D', 'Laureano Cañadas', '2028643T', 107),
('6741073D', 'Purificacion Lobo', '2028643T', 108),
('9554072N', 'Juan-Luis Barros','2028643T', 109),
('3205097B', 'Florencio Castellano', '2028643T', 110);

Select * from Despachos;
Select * from Directores;
