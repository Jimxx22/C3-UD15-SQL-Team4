Create database ud1411;
Use ud1411;

Drop table if exists Reserva;
Drop table if exists Equipos;
Drop table if exists Investigadores;
Drop table if exists Facultad;

Create table Facultad(
codigo int,
nombre varchar(100),
Primary key(codigo)
);

Create table Equipos(
numSerie char(4),
nombre varchar(100),
facultad int,
Primary key(numSerie),
constraint fk_EquiposFacultad FOREIGN KEY (facultad) 
REFERENCES Facultad(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

Create table Investigadores (
dni varchar(8),
nomApels varchar(255),
facultad int,
PRIMARY KEY (dni),
constraint fk_InvestigadoresFacultad FOREIGN KEY (facultad) 
REFERENCES Facultad(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);


create table Reserva(
dni varchar(8) not null,
numSerie char(4) not null,
comienzo datetime,
fin datetime,
primary key (dni, numSerie),
constraint fk_ReservaInvestigador FOREIGN KEY (dni) 
REFERENCES Investigadores(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_ReservaEquipo FOREIGN KEY (numSerie) 
REFERENCES Equipos(numSerie)
ON DELETE CASCADE ON UPDATE CASCADE
);

