DROP DATABASE IF EXISTS ivan_pelis;
CREATE DATABASE ivan_pelis;
USE ivan_pelis;
--

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