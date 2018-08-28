DROP DATABASE IF EXISTS ivan_pelis;
CREATE DATABASE ivan_pelis;
USE ivan_pelis;
--
CREATE TABLE producciones(
  id_produccion int AUTO_INCREMENT,
  titulo varchar(255) NOT NULL,
  estreno int NOT NULL,
  puntuacion float,
  vos bool,
  vista bool,
  nacionalidad varchar(255),
  INDEX(estreno),
  PRIMARY KEY(id_produccion)
  );
CREATE TABLE franquicias(
  id_franquicia int AUTO_INCREMENT,
  franquicia varchar(255) NOT NULL,
  UNIQUE(franquicia),
  PRIMARY KEY(id_franquicia)
  );
CREATE TABLE pertenece(
  id_produccion int,
  id_franquicia int,
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion),
  FOREIGN KEY(id_franquicia) REFERENCES franquicias(id_franquicia),
  PRIMARY KEY(id_produccion,id_franquicia)
  );
CREATE TABLE generos(
  id_genero int AUTO_INCREMENT,
  genero varchar(255) NOT NULL,
  UNIQUE(genero),
  PRIMARY KEY(id_genero)
  );
CREATE TABLE proyecta(
  id_produccion int,
  id_genero int,
  PRIMARY KEY(id_produccion,id_genero),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion),
  FOREIGN KEY(id_genero) REFERENCES generos(id_genero)
  );
CREATE TABLE artistas(
  id_artista int AUTO_INCREMENT,
  artista varchar(255) ,
  nacimiento int,
  PRIMARY KEY(id_artista)
  );
CREATE TABLE roles(
  id_rol int AUTO_INCREMENT,
  rol varchar(255),
  UNIQUE(rol),
  PRIMARY KEY(id_rol)
  );
CREATE TABLE participan(
  id_artista int,
  id_produccion int,
  id_rol int,
  PRIMARY KEY(id_artista,id_produccion,id_rol),
  FOREIGN KEY(id_artista) REFERENCES artistas(id_artista),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion),
  FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
  );
CREATE TABLE temporadas(
  id_temporada int AUTO_INCREMENT,
  id_produccion int,
  temporada int NOT NULL,
  capitulos int NOT NULL,
  vistos float,
  PRIMARY KEY(id_temporada),
  FOREIGN KEY(id_produccion) REFERENCES producciones(id_produccion)
  );
