USE ivan_pelis;

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



-- Dumping data for table producciones
--
INSERT INTO producciones VALUES
(1, 'Guardianes de la Galaxia', 2014, 'EEUU', 0, 0, 9, 1),
(2, 'Guardianes de la Galaxia 2', 2017, 'EEUU', 0, 0, 8.5, 1),
(3, 'Titanic', 1997, 'EEUU', 0, 0, 9.5, 1),
(4, 'Deadpool 2', 2018, 'EEUU', 0, 0, NULL, 0),
(5, 'Spider-Man', 2002, 'EEUU', 0, 0, 8.8, 1),
(6, 'The Big Bang Theory', 2007, 'EEUU', 0, 0, 9.5, 0),
(7, 'La Vida es Bella', 1997, 'ITALIA', 0, 0, 9.7, 1),
(8, 'Buscando a Nemo', 2003, 'EEUU', 0, 0, 9.6, 1),
(9, 'Wall-E', 2008, 'EEUU', 0, 0, 9.5, 1),
(10, 'Up', 2009, 'EEUU', 0, 0, 9.2, 1),
(11, 'Juego de Tronos', 2011, 'EEUU, Reino Unido', 0, 0, 9.7, 0),
(12, 'The Walking Dead', 2010, 'EEUU', 0, 0, 9.5, 1),
(13, 'Fear the Walking Dead', 2015, 'EEUU', 0, 0, NULL, 1),
(14, 'Agents of S.H.I.E.L.D.', 2013, 'EEUU', 0, 0, 9, 1),
(15, 'Arrow', 2012, 'EEUU', 0, 0, 9.2, 1),
(16, 'Daredevil', 2015, 'EEUU', 0, 0, NULL, 0),
(17, 'Jessica Jones', 2015, 'EEUU', 0, 0, NULL, 0),
(18, 'The Flash', 2014, 'EEUU', 0, 0, NULL, 0),
(19, 'The Punisher', 2017, 'EEUU', 0, 0, NULL, 0),
(20, 'Legends of Tomorrow', 2016, 'EEUU', 0, 0, NULL, 0),
(21, 'Elementary', 2012, 'EEUU', 0, 0, 8.9, 1),
(22, 'Sherlock', 2010, 'Reino Unido, EEUU', 0, 0, 9.4, 1),
(23, 'Stranger Things', 2016, 'EEUU', 0, 0, NULL, 0),
(24, 'The 100', 2014, 'EEUU', 0, 0, NULL, 0),
(25, 'Vikings', 2013, 'Irlanda, Canada', 0, 0, NULL, 0),
(26, 'El lado bueno de las cosas', 2012, 'EEUU', 0, 0, 8.8, 1),
(27, 'El Señor de los Anillos: La Comunidad del Anillo', 2001, 'Nueva Zelanda, EEUU', 0, 0, 9.7, 1),
(28, 'El Señor de los Anillos: Las dos Torres', 2002, 'EEUU, Nueva Zelanda', 0, 0, 9.6, 1),
(29, 'El Señor de los Anillos: El Retorno del Rey', 2003, 'EEUU, Nueva Zelanda', 0, 0, 9.5, 1),
(30, 'Los Vengadores', 2012, 'EEUU', 0, 0, 9.5, 1);


-- 
-- Dumping data for table artistas
--
INSERT INTO artistas VALUES
(1, 'Chris Pratt', 1979),
(2, 'Zoe Saldana', 1978),
(3, 'Dave Bautista', 1969),
(4, 'Vin Diesel', 1967),
(5, 'Bradley Cooper', 1975),
(6, 'James Gunn', 1966),
(7, 'James Cameron', 1954),
(8, 'Leonardo DiCaprio', 1974),
(9, 'Kate Winslet', 1975),
(10, 'David Leitch', 1969),
(11, 'Ryan Reynolds', 1976),
(12, 'Josh Brolin', 1968),
(13, 'Chuck Lorre', 1952),
(14, 'Bill Prady', 1960),
(15, 'Johnny Galecki', 1975),
(16, 'Jim Parsons', 1973),
(17, 'Kaley Cuoco', 1985),
(18, 'Simon Helberg', 1980),
(19, 'Kunal Nayyar', 1981),
(20, 'Melissa Rauch', 1980),
(21, 'Mayim Bialik', 1975),
(22, 'Roberto Benigni', 1952),
(23, 'Nicoletta Braschi', 1960),
(24, 'Giorgio Cantarini', 1992),
(25, 'Marisa Paredes', 1946),
(26, 'Sami Raimi', 1959),
(27, 'Tobey Maguire', 1975),
(28, 'Kirsten Dunst', 1982),
(29, 'Willem Dafoe', 1955),
(30, 'James Franco', 1978),
(31, 'Andrew Stanton', 1965),
(32, 'Lee Unkrich', 1967),
(33, 'Albert Brooks', 1947),
(34, 'Ellen DeGeneres', 1958),
(35, 'Alexander Gould', 1994),
(36, 'Brad Garrett', 1960),
(37, 'Allison Janney', 1959),
(38, 'Pete Docter', 1968),
(39, 'Bob Peterson', 1961),
(40, 'Edward Asner', 1929),
(41, 'Christopher Plummer', 1929),
(42, 'Jordan Nagai', 2000),
(43, 'Delroy Lindo', 1952),
(44, 'Ben Burtt', 1948),
(45, 'Elissa Knight', 1975),
(46, 'Jeff Garlin', 1962),
(47, 'Fred Willard', 1939),
(48, 'Sigourney Weaver', 1949),
(49, 'David Benioff', 1970),
(50, 'Peter Dinklage', 1969),
(51, 'Lena Headey', 1973),
(52, 'Emilia Clarke', 1986),
(53, 'Kit Harington', 1986),
(54, 'Sophie Turner', 1996),
(55, 'Maisie Williams', 1997),
(56, 'Nikolaj Coster-Waldau', 1970),
(57, 'Iain Glen', 1961),
(58, 'Alfie Allen', 1986),
(59, 'John Bradley', 1988),
(60, 'Aidan Gillen', 1968),
(61, 'Conleth Hill', 1964),
(62, 'Gwendoline Christie', 1978),
(63, 'Frank Darabont', 1959),
(64, 'Andrew Lincoln', 1973),
(65, 'Norman Reedus', 1969),
(66, 'Melissa McBride', 1965),
(67, 'Lauren Cohan', 1982),
(68, 'Chandler Riggs', 1999),
(69, 'Danai Gurira', 1978),
(70, 'Steven Yeun', 1983),
(71, 'Alanna Masterson', 1988),
(72, 'Sonequa Martin-Green', 1985),
(73, 'Josh McDermitt', 1978),
(74, 'Christian Serratos', 1990),
(75, 'Seth Gilliam', 1968);

-- 
-- Dumping data for table franquicias
--
INSERT INTO franquicias VALUES
(1, 'Marvel'),
(2, 'DC'),
(3, 'Star Trek'),
(4, 'Star Wars'),
(5, 'Sin franquicia'),
(6, 'Harry Potter'),
(7, 'El Señor de los Anillos'),
(8, 'El Hobbit'),
(9, 'Fast & Furious'),
(10, 'Jurassic Park'),
(11, 'Piratas del Caribe');




-- 
-- Dumping data for table generos
--
INSERT INTO generos VALUES
(1, 'Acción'),
(2, 'Animación'),
(3, 'Aventura'),
(4, 'SciFi'),
(5, 'Comedia'),
(6, 'Drama'),
(7, 'Fantasía'),
(8, 'Romance'),
(9, 'Suspense'),
(10, 'Terror'),
(11, 'Bélico'),
(12, 'Histórico'),
(13, 'Crímen');

-- 
-- Dumping data for table roles
--
INSERT INTO roles VALUES
(1, 'Actúa'),
(2, 'Dirige'),
(3, 'Produce'),
(4, 'Escribe');

-- 
-- Dumping data for table participan
--
INSERT INTO participan VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 2),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 2),
(3, 7, 2),
(3, 8, 1),
(3, 9, 1),
(4, 10, 2),
(4, 11, 1),
(4, 12, 1),
(5, 26, 2),
(5, 27, 1),
(5, 28, 1),
(5, 29, 1),
(5, 30, 1),
(6, 13, 2),
(6, 15, 1),
(6, 16, 1),
(6, 17, 1),
(6, 18, 1),
(6, 19, 1),
(6, 20, 1),
(6, 21, 1),
(7, 22, 1),
(7, 22, 2),
(7, 23, 1),
(7, 24, 1),
(7, 25, 1),
(8, 31, 1),
(8, 31, 2),
(8, 33, 1),
(8, 34, 1),
(8, 35, 1),
(8, 36, 1),
(8, 37, 1),
(8, 39, 1),
(9, 31, 2),
(9, 44, 1),
(9, 45, 1),
(9, 46, 1),
(9, 47, 1),
(9, 48, 1),
(10, 38, 2),
(10, 40, 1),
(10, 41, 1),
(10, 42, 1),
(10, 43, 1),
(11, 49, 4),
(11, 50, 1),
(11, 51, 1),
(11, 52, 1),
(11, 53, 1),
(11, 54, 1),
(11, 55, 1),
(11, 56, 1),
(11, 57, 1),
(11, 58, 1),
(11, 59, 1),
(11, 60, 1),
(11, 61, 1),
(11, 62, 1),
(12, 63, 4),
(12, 64, 1),
(12, 65, 1),
(12, 66, 1),
(12, 67, 1),
(12, 68, 1),
(12, 69, 1),
(12, 70, 1),
(12, 71, 1),
(12, 72, 1),
(12, 73, 1),
(12, 74, 1),
(12, 75, 1);


-- 
-- Dumping data for table pertenece
--
INSERT INTO pertenece VALUES
(1, 1),
(2, 1),
(3, 5),
(4, 1),
(5, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 2),
(27, 7),
(28, 7),
(29, 7),
(30, 1);

-- 
-- Dumping data for table proyecta
--
INSERT INTO proyecta VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(2, 4),
(3, 6),
(3, 8),
(4, 1),
(4, 3),
(4, 5),
(5, 1),
(5, 3),
(5, 4),
(6, 5),
(6, 8),
(7, 5),
(7, 6),
(7, 11),
(8, 2),
(9, 2),
(10, 2),
(11, 1),
(11, 3),
(11, 6),
(12, 6),
(12, 10),
(12, 9),
(13, 6),
(13, 10),
(13, 4),
(14, 1),
(14, 3),
(14, 6),
(15, 1),
(15, 3),
(15, 13),
(16, 1),
(16, 13),
(16, 6),
(17, 1),
(17, 13),
(17, 6),
(18, 1),
(18, 3),
(18, 6),
(19, 1),
(19, 3),
(19, 13),
(20, 1),
(20, 3),
(20, 6),
(21, 13),
(21, 6),
(21, 9),
(22, 13),
(22, 6),
(22, 9),
(23, 6),
(23, 7),
(23, 10),
(24, 6),
(24, 9),
(24, 4),
(25, 1),
(25, 3),
(25, 6),
(26, 5),
(26, 6),
(26, 8),
(27, 3),
(27, 6),
(27, 7),
(28, 3),
(28, 6),
(28, 7),
(29, 1),
(29, 3),
(29, 6),
(30, 1),
(30, 3),
(30, 4);

-- 
-- Dumping data for table temporadas
--
INSERT INTO temporadas VALUES
(1, 6, 1, 17, 17),
(2, 6, 2, 23, 23),
(3, 6, 3, 23, 23),
(4, 11, 1, 10, 10),
(5, 11, 2, 10, 10),
(6, 11, 3, 10, 10),
(7, 12, 1, 6, 6),
(8, 12,	2, 13, 13),
(9, 12,	3, 16, 16),
(10, 13, 1, 6, 0),
(11, 14, 1, 22, 22),
(12, 15, 1, 23, 23),
(13, 16, 1, 13, 0),
(14, 17, 1, 13, 0),
(15, 18, 1, 23, 0),
(16, 19, 1, 13, 0),
(17, 20, 1, 13, 0),
(18, 21, 1, 24, 24),
(19, 22, 1, 4, 4),
(20, 23, 1, 8, 0),
(21, 24, 1, 13, 0),
(22, 25, 1, 9, 0);


-- MOSTRAR TODAS LAS PRODUCCIONES Y GÉNEROS

SELECT titulo,genero,estreno,puntuacion
  FROM  proyecta JOIN producciones
  USING(id_produccion) JOIN generos USING(id_genero) ORDER BY titulo;


-- MOSTRAR TODAS LAS PELÍCULAS
SELECT * FROM producciones LEFT JOIN (
    SELECT DISTINCT id_produccion FROM temporadas
  ) c1 USING(id_produccion) WHERE c1.id_produccion IS NULL ORDER BY titulo;


-- MOSTRAR TODAS LAS SERIES
SELECT * FROM producciones LEFT JOIN (
    SELECT DISTINCT id_produccion FROM temporadas
  ) c1 USING(id_produccion) WHERE c1.id_produccion IS NOT NULL ORDER BY titulo;


-- MOSTRAR TODAS LAS SERIES (Es lo mismo que arriba, pero mucho menos eficiente)

 SELECT titulo,estreno,pais,puntuacion,temporada,capitulos,vistos FROM(
  SELECT id_temporada FROM temporadas
    WHERE temporada LIKE temporada=1
 ) c1 JOIN temporadas USING(id_temporada)
  JOIN producciones USING(id_produccion) ORDER BY titulo;


-- MOSTRAR PELÍCULAS POR GÉNERO           (En el la consulta en php, sustituir id_genero=1 por:) -->>      id_genero=".$_GET['id_genero']."

SELECT * FROM (
    SELECT c1.id_produccion FROM (
        SELECT DISTINCT id_produccion FROM proyecta WHERE id_genero=1
      ) c1 LEFT JOIN temporadas USING(id_produccion)
      WHERE temporadas.id_produccion IS NULL  
  ) c1 JOIN producciones USING(id_produccion) ORDER BY titulo;


-- MOSTRAR PELÍCULAS POR GÉNERO (menos eficiente)          (En el la consulta en php, sustituir id_genero=1 por:) -->>      id_genero=".$_GET['id_genero']."

SELECT * FROM (
  SELECT id_produccion FROM proyecta
    WHERE id_genero=1
  ) c1 JOIN (
      SELECT * FROM producciones WHERE id_produccion NOT IN (
        SELECT DISTINCT id_produccion FROM temporadas
      )
    ) producciones USING(id_produccion) ORDER BY titulo;


-- MOSTRAR SERIES POR GÉNERO              (En el la consulta en php, sustituir id_genero=1 por:) -->>      id_genero=".$_GET['id_genero']."

SELECT * FROM (
    SELECT c1.id_produccion FROM (
        SELECT DISTINCT id_produccion FROM proyecta WHERE id_genero=1
      ) c1 LEFT JOIN temporadas USING(id_produccion)
      WHERE temporadas.id_produccion IS NOT NULL  
  ) c1 JOIN producciones USING(id_produccion) ORDER BY titulo;


-- MOSTRAR SERIES POR GÉNERO (menos eficiente)              (En el la consulta en php, sustituir id_genero=1 por:) -->>      id_genero=".$_GET['id_genero']."

SELECT * FROM (
  SELECT id_produccion FROM proyecta
    WHERE id_genero=1
  ) c1 JOIN (
      SELECT * FROM producciones WHERE id_produccion IN (
        SELECT DISTINCT id_produccion FROM temporadas
      )
    ) producciones USING(id_produccion) ORDER BY titulo;



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




