Create database ud1216;
use ud1216;

Drop table if exists Mensajes;
Drop table if exists Retweets;
Drop table if exists MeGustas;
Drop table if exists Multimedia;
Drop table if exists Posts;
Drop table if exists Sigue;
Drop table if exists Usuarios;

Create table Usuarios(
userName varchar(25) not null,
nombre varchar(25),
apellidos varchar (50),
descripcion varchar(200),
foto text,
fecha_nacimiento date,
fecha_creacion date,
followers int,
_following int,
Primary key(userName));

Create table Sigue(
id int auto_increment not null,
idUsuarioFollowed varchar(20),
idUsuarioFollower varchar(20),
Primary key(id),
foreign key(idUsuarioFollowed )
references Usuarios(userName)
on delete cascade on update cascade,
foreign key(idUsuarioFollower )
references Usuarios(userName)
on delete cascade on update cascade
);

Create table Posts (
id int auto_increment not null,
fecha date,
text varchar(200),
likes int,
rts int,
idUsuario varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (idUsuario) references Usuarios (userName) 
on delete cascade on update cascade
);

Create table Multimedia( 
id int,
multimedia text,
primary key(id),
foreign key(id)
references Posts(id)
on delete cascade on update cascade);


Create table Mensajes (id int auto_increment not null,
idEnvia varchar(20),
idRecive varchar(20),
Contenido varchar(255),
Primary key(id),
Foreign key(idEnvia)
References Usuarios(userName)
on delete cascade on update cascade,
Foreign key (idRecive)
References Usuarios(userName)
On delete cascade on update cascade
);

Create table Retweets (
id int auto_increment not null,
idUsuario varchar(20),
idPost int,
Primary key (id),
Foreign key(idUsuario)
References Usuarios(userName)
on delete cascade on update cascade,
Foreign key (idPost)
References Posts(id)
On delete cascade on update cascade
);

Create table MeGustas (
id int auto_increment not null,
idUsuario varchar(20),
idPost int,
PRIMARY KEY (id),
FOREIGN KEY (idUsuario) references Usuarios(userName)
on delete cascade on update cascade,
FOREIGN KEY (idPost) references Posts(id)
on delete cascade on update cascade
);

#INSERTS

Insert into Usuarios (userName, nombre, apellidos, descripcion, foto, fecha_nacimiento, fecha_creacion, followers, _following) values 
('ChirivíaNotable','Sacramento','Salcedo','Escritor. Aficionado a la cultura pop. Aficionado al tocino.', 'foto', '1998-01-01', '2018-01-01', 10, 500),
('NietaEntrometida','Angelina','Jiménez','Fanático de internet devoto. Erudito incondicional del café. Experto en web. Introvertido. Emprendedor.', 'foto', '1990-02-14', '2016-01-01', 23, 150),
('PimientoAmargado','Yassine','Comas','Adicto a Twitter. Defensor del tocino de por vida. adicto a la comida', 'foto', '1995-01-01', '2013-01-01', 15, 100),
('PapiTranquilizador','Judit','Esteban','Experto en televisión. Adicto a la comida.', 'foto', '2002-01-01', '2017-01-01', 10000, 30),
('PeraApto','Moussa','Quesada','Explorador. Introvertido. Jugador. Comunicador. Emprendedor.', 'foto', '1969-01-01', '2018-01-01', 56723, 600);

Insert into Posts (fecha, text, likes, rts, idUsuario) values 
('2022-07-24', 'Golazo de Raphinha', 1035, 237, 'PeraApto'),
('2022-07-07', 'Sesion de Quevedo TOP', 35000, 2000, 'ChirivíaNotable'),
('2010-07-11', 'Iniesta de mi vida', 1743, 95, 'NietaEntrometida'),
('2019-12-16', 'Qué mala pelicula de Star Wars', 21859, 812, 'PapiTranquilizador'),
('2018-03-25', 'El tocino es el mejor alimento del mundo', 4230, 42, 'PimientoAmargado');

Insert into Multimedia (id, multimedia) values 
(3, 'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2020/04/09/15864335743479.jpg'),
(5, 'https://dam.cocinafacil.com.mx/wp-content/uploads/2019/08/dorar-tocino1.jpg');



Insert into Sigue (idUsuarioFollowed, idUsuarioFollower) values
('ChirivíaNotable','PapiTranquilizador'),
('ChirivíaNotable','PeraApto'),
('NietaEntrometida','PapiTranquilizador'),
('NietaEntrometida','PeraApto'),
('PeraApto','PimientoAmargado'),
('PimientoAmargado','PeraApto'),
('PapiTranquilizador','PimientoAmargado');

Insert into Mensajes (idEnvia, idRecive,Contenido) values
('ChirivíaNotable','NietaEntrometida','Hola, como estas?'),
('NietaEntrometida','ChirivíaNotable','Bien, viendo la tele'),
('PapiTranquilizador','PeraApto','Tengo lo tuyo en el armario'),
('PimientoAmargado','PeraApto', 'A que hora quedamos esta tarde?'),
('PeraApto','PimientoAmargado', 'Al final no puedo quedar');

Insert into Retweets (idUsuario,idPost) values
('ChirivíaNotable',3),
('NietaEntrometida',4),
('PimientoAmargado',3),
('PapiTranquilizador',3),
('PapiTranquilizador',5),
('ChirivíaNotable',5),
('PeraApto',2),
('NietaEntrometida',5);

Insert into MeGustas (idUsuario, idPost) values
('ChirivíaNotable',3),
('NietaEntrometida',4),
('PimientoAmargado',3),
('PapiTranquilizador',3),
('PapiTranquilizador',5),
('ChirivíaNotable',5),
('PeraApto',2),
('NietaEntrometida',5);

Select * from Usuarios;
Select * from Sigue;
Select * from Posts;
Select * from Multimedia;
Select * from MeGustas;
Select * from Retweets;
Select * from Mensajes;