DROP DATABASE IF EXISTS pelis_series; 
CREATE DATABASE pelis_series;
USE pelis_series;

CREATE TABLE producciones(
  id_produccion int AUTO_INCREMENT,
  titulo varchar(255) NOT NULL,
  estreno int NOT NULL,
  pais varchar(255),
  vose bool,
  vos bool,
  puntuacion float,
  vista bool,
  PRIMARY KEY(id_produccion),
  INDEX(estreno)
  );

CREATE TABLE generos(
  id_genero int AUTO_INCREMENT,
  genero varchar(255) NOT NULL,
  PRIMARY KEY(id_genero),
  UNIQUE(id_genero)
  );

CREATE TABLE franquicias(
  id_franquicia int AUTO_INCREMENT,
  franquicia varchar(255) NOT NULL,
  PRIMARY KEY(id_franquicia),
  UNIQUE(franquicia)
  );

CREATE TABLE temporadas(
  id_temporada int AUTO_INCREMENT,
  id_produccion int,
  temporada int NOT NULL,
  capitulos int NOT NULL,
  vistos int,
  PRIMARY KEY(id_temporada),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion)
  );

CREATE TABLE artistas(
  id_artista int AUTO_INCREMENT,
  artista varchar(255),
  nacimiento int,
  PRIMARY KEY(id_artista)
  );

CREATE TABLE roles(
  id_rol int AUTO_INCREMENT,
  rol varchar(255),
  PRIMARY KEY(id_rol),
  UNIQUE(rol)
  );

/* CREAR LA RELACIÓN PERTENECE */

CREATE TABLE pertenece(
  id_produccion int,
  id_franquicia int,
  PRIMARY KEY(id_produccion,id_franquicia),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion),
  FOREIGN KEY(id_franquicia) REFERENCES franquicias(id_franquicia)
  );

/* CREAR LA RELACIÓN PROYECTA */

CREATE TABLE proyecta(
  id_produccion int,
  id_genero int,
  PRIMARY KEY(id_produccion,id_genero),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion),
  FOREIGN KEY(id_genero) REFERENCES generos(id_genero)
  );

/* CREAR LA RELACIÓN PARTICIPAN */

CREATE TABLE participan(
  id_produccion int,
  id_artista int,
  id_rol int,
  PRIMARY KEY(id_produccion,id_artista,id_rol),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion),
  FOREIGN KEY(id_artista) REFERENCES artistas(id_artista),
  FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
  );

SELECT * FROM producciones; 

SELECT * FROM generos;

SELECT * FROM proyecta;

SELECT * FROM franquicias;

SELECT * FROM pertenece; 

SELECT * FROM artistas; 

SELECT * FROM participan;  

SELECT * FROM roles; 

SELECT * FROM temporadas; 



INSERT producciones (titulo,estreno,nacionalidad,vos,puntuacion,vista)
  VALUES
  ('La Vida es Bella',1997,'ITALIA',0,9.7,1);

INSERT generos (genero)
  VALUES
  ('Bélico');

INSERT artistas (artista,nacimiento)
  VALUES
  ('Roberto Benigni',1952),
('Nicoletta Braschi',1960),
('Giorgio Cantarini',1992),
('Marisa Paredes',1946);

SELECT titulo,genero,estreno
  FROM  proyecta JOIN producciones
  USING(id_produccion) JOIN generos USING(id_genero);


-- PRODUCCIONES DEL GÉNERO 3

SELECT id_produccion FROM proyecta WHERE id_genero=3; 
SELECT * FROM (
 			 SELECT id_produccion FROM proyecta WHERE id_genero=3
 			) c1 JOIN producciones USING(id_produccion);


-- ARTISTAS QUE PARTICIPAN Y ROLES EN PRODUCCIONES DE GÉNERO 3   (En el la consulta en php, sustituir titanic por:) -->>      id_genero=".$_GET['id_genero']."

SELECT id_produccion FROM proyecta WHERE id_genero=3;
SELECT id_artista FROM(
  SELECT id_produccion FROM proyecta WHERE id_genero=3
  ) c1 JOIN participan USING(id_produccion);

SELECT * FROM (
SELECT id_artista,id_produccion,id_rol FROM(
  SELECT id_produccion FROM proyecta WHERE id_genero=3
    ) c1 JOIN participan USING(id_produccion)
  ) c2 JOIN artistas USING(id_artista)
  JOIN roles USING(id_rol) ORDER BY rol DESC;

-- IGUAL PERO MOSTRANDO EL ARTISTA

SELECT id_produccion FROM proyecta WHERE id_genero=3;
SELECT id_artista FROM(
  SELECT id_produccion FROM proyecta WHERE id_genero=3
  ) c1 JOIN participan USING(id_produccion);

SELECT * FROM (
SELECT id_artista,id_produccion FROM(
  SELECT id_produccion FROM proyecta WHERE id_genero=3
    ) c1 JOIN participan USING(id_produccion)
  ) c2 JOIN artistas USING(id_artista); 


-- ARTISTAS Y ROLES DE CADA PRODUCCIÓN

SELECT titulo,artista,rol
  FROM  participan
  JOIN producciones USING(id_produccion)
  JOIN artistas USING(id_artista)
  JOIN roles USING(id_rol)
  ORDER BY titulo;


-- ARTISTAS SEGÚN GÉNERO (En el la consulta en php, sustituir titanic por:) -->>       '%".$_GET['busqueda']."%'

SELECT id_produccion FROM producciones
  WHERE titulo LIKE '%titanic%';

SELECT DISTINCT id_genero FROM (
  SELECT id_produccion FROM producciones
    WHERE titulo LIKE '%titanic%'
  )c1 JOIN proyecta USING(id_produccion);

SELECT * FROM (
 SELECT id_artista,id_produccion,id_rol FROM(
  SELECT id_produccion FROM proyecta WHERE id_genero=1
 ) c1 JOIN participan USING(id_produccion)
) c2 JOIN artistas USING(id_artista)
  JOIN roles USING(id_rol) ORDER BY rol DESC;

-- ------------------------------------

SELECT * FROM (
 SELECT id_artista,id_produccion,id_rol FROM(
  SELECT id_produccion FROM producciones
    WHERE titulo LIKE '%titanic%'
 ) c1 JOIN participan USING(id_produccion)
) c2 JOIN artistas USING(id_artista)
  JOIN roles USING(id_rol) ORDER BY rol DESC;




