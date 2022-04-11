create database notas;

use notas;

create table usuarios(
id int not null  auto_increment,
nombre varchar(255) not null,
apellido varchar(255) not null,
email varchar(255) not null,
primary key (id)
);

insert into usuarios (nombre, apellido, email) 
values('George', 'Washington', 'georgeWashington@gmail.com'),
('Genghis', 'Khan', 'genghisKhan@gmail.com'),
('Karl', 'Marx', 'karlMarx@gmail.com'),
('Alejandro', 'Magno', 'alejandroMagno@gmail.com'),
('Julio', 'Caesar', 'julioCaesar@gmail.com'),
('Napoleon', 'Bonaparte', 'napoleonBonaparte@gmail.com'),
('Douglas', 'MacArthur', 'douglasMacarthur@gmail.com'),
('Albert', 'Einstein', 'albertEinstein@gmail.com'),
('Pablo', 'Picasso', 'pablitoPicasso@gmail.com'),
('Leonardo', 'Vinchi', 'leoDaVinchy@gmail.com');


create table notas(
id int not null  auto_increment,
titulo varchar(255) not null,
descripcion varchar(100) not null,
eliminacion int (6),
fecha_de_modificacion datetime,
fecha_de_creacion datetime,
id_usuario int,
primary key (id),
foreign key (id_usuario) references usuarios(id)
);

insert into notas (titulo, descripcion, eliminacion, fecha_de_modificacion, fecha_de_creacion, id_usuario)
values ('George Washington journal', 'was an American military officer, statesman.', 1, '1900-12-23 12:46:35','1901-04-03 23:39:52', 1),
('Genghis Khan diary', 'was the founder and first Great Khan.',1,'1901-09-01 02:53:19', '1913-08-26 10:03:45', 2),
('Karl Marx manifesto', 'was a  critic of political economy, economist.', 0,'1915-07-26 20:58:05', '1915-11-09 16:20:12', 3),
('Alejandro Magno biography', 'was a king of the ancient Greek kingdom of Macedon.', 0,'1925-01-17 09:22:49', '1928-11-14 16:34:12', 4),
('Julio Caesar memento', 'was a Roman general and statesman.', 1,'1940-03-25 21:07:51', '1941-07-05 18:25:22', 5),
('Napoleon Bonaparte diary', 'was a French military and political leader.', 0,'1948-08-16 06:37:30', '1955-05-10 20:37:10', 6),
('Douglas MacArthur binnacle', 'was an American military leader.', 1,'1958-11-05 23:56:34', '1966-06-28 13:05:35', 7),
('Albert Einstein notes', 'was a German-born theoretical physicist', 0,'1968-09-23 01:27:23', '1974-09-23 05:49:45', 8),
('Pablo Picassos book', 'was a Spanish painter, sculptor, printmaker.', 1,'1979-07-19 19:33:55', '1981-07-28 04:57:51', 9),
('Da Vinci notes', 'was an Italian polymath of the High Renaissance.', 0, '1988-06-18 18:13:48','1989-06-05 20:42:53', 10);


create table categorias(
id int not null  auto_increment,
nombre varchar(100),
primary key (id)
);

insert into categorias(nombre)
values ('Explicativa'),('Descriptiva'),('Dialogal'),('Narrativa'),('Argumentativa'), ('instructivo'), ('expositivo'),('científico'),('literario'),('publicitario');

create table notas_categorias(
id int not null  auto_increment,
id_nota int,
id_categoria int,
primary key (id),
foreign key (id_categoria) references categorias(id),
foreign key (id_nota) references notas(id)
);

insert into notas_categorias(id_nota, id_categoria)
values (1,1), (2,2), (3,2), (4,3), (5,4),(6,5),(7,6),(8,7),(9,8),(10,9);

create table registro(
id int not null  auto_increment,
id_nota int, 
accion varchar(100),
fecha datetime,
primary key (id),
foreign key (id_nota) references notas(id)
);

insert into registro (id_nota, accion, fecha)
values (1, 'Eliminada','1988-06-18 18:13:48'),(2, 'Modificada','1979-07-19 19:33:55'),
(3, 'Creada','1988-06-18 18:13:48'),(4, 'Eliminada','1979-07-19 19:33:55'),
(5, 'Eliminada','1988-06-18 18:13:48'),(6, 'Modificada','1979-07-19 19:33:55'),
(6, 'Modificada','1988-06-18 18:13:48'),(8, 'Creada','1979-07-19 19:33:55'),
(9, 'Creada','1988-06-18 18:13:48'),(10, 'Eliminada','1979-07-19 19:33:55');

