<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <!-- content=width=device-width (ancho de la pantalla) (width=600 ancho de 600) initial-scale=1 (Escala inicial móvil), scalable (zoom yes or no), contraer yes or no -->
    <title>Películas / Pelis y Series de Iván</title>
    <?php 
        if(!isset($_GET['id_genero'])) $_GET['id_genero']=1;   /* Es igual que:   if(isset($_GET['id_genero'])==0) */
        include_once "libreria.php";
        if(isset($_GET['busqueda'])){                          /* Es igual que:   if(isset($_GET['busqueda'])==1) */
            sql12js('datos','ivan_pelis',"
                SELECT * FROM producciones
                    WHERE titulo LIKE '%".$_GET['busqueda']."%' ORDER BY titulo;
            ");

            sql12js('artistas','ivan_pelis', " SELECT * FROM (
                     SELECT id_artista,id_produccion,id_rol FROM(
                      SELECT id_produccion FROM producciones
                        WHERE titulo LIKE '%".$_GET['busqueda']."%'
                     ) c1 JOIN participan USING(id_produccion)
                    ) c2 JOIN artistas USING(id_artista)
                      JOIN roles USING(id_rol) ORDER BY rol DESC;");
        }
        else{
            sql12js('datos','ivan_pelis', " SELECT * FROM (
                    SELECT DISTINCT c1.id_produccion FROM (
                    SELECT id_produccion FROM proyecta WHERE id_genero=".($_GET['id_genero']*1)."
                ) c1 LEFT JOIN temporadas USING(id_produccion)
                    WHERE temporadas.id_produccion IS NULL  
                ) c1 JOIN producciones USING(id_produccion) ORDER BY titulo; 
            ");


            sql12js('artistas','ivan_pelis', "SELECT * FROM (
                SELECT id_artista,id_produccion,id_rol FROM(
                    SELECT id_produccion FROM proyecta WHERE id_genero=".$_GET['id_genero']."
                        ) c1 JOIN participan USING(id_produccion)
                            ) c2 JOIN artistas USING(id_artista)
                                JOIN roles USING(id_rol) ORDER BY rol DESC;");

        }

        sql12js('generos','ivan_pelis', " SELECT * FROM generos ORDER BY genero;");

    ?>  <!-- <? ?> Aquí se introduce el php para que pueda ejecutarse -->

    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
    <script type="text/javascript" src="js/index.js"></script>
</head>

<body>
    <!-- Inicio del contenedor -->
    <div id="wrapper">
        <header>
        	<h1><a href="index.php">INICIO</a> / PELÍCULAS <img src="img/logo_rollo_mini.png"></h1>
            <p>En esta página podremos ver toda la información de las películas de la base de datos.</p>
            <form>
                <input type="text" name="busqueda">
                    <button class="buscar">Buscar</button>
                </input>
            </form>
        </header>

        <div id='main'>
            <article>
                <div class="content">

                    <script type="text/javascript">

                        for (var i = 0; i < datos.length; i++) {
                            document.write('<div class="producciones1">');
                            document.write('<div>');
                            document.write('<h3>');
                            document.write(datos[i].titulo);
                            document.write('</h3>');
                            document.write('<p>');
                            document.write(datos[i].estreno);
                            document.write(' , País: ');
                            document.write(datos[i].pais);
                            document.write(' , Puntuación: ');
                            if(datos[i].puntuacion==0){
                            document.write(' - ');
                        }else{
                            document.write(datos[i].puntuacion);
                        }
                            document.write(' , Vista: ');
                            if(datos[i].vista==1){
                                document.write('SÍ');
                                document.write('</p>');
                            }else{
                                document.write('NO');
                                document.write('</p>');
                            }
                            document.write('<hr>');
                            document.write('<p>');
                            document.write(artistas[0].rol);
                            document.write(' : ');

                        for (var j = 0; j < artistas.length; j++) {
                            if(datos[i].id_produccion==artistas[j].id_produccion){
                                document.write(artistas[j].artista);
                                document.write(' , ');
                                }
                            }
                            document.write('</p>');
                            document.write('</div>');
                            document.write('</div>');
                        }

                    </script>

                </div>
            </article>
            <nav>
                <div class="generos-menu1">
                    <div class="generos-fila1">
                    </div>
                </div>
            </nav>
            <aside>
                <div class="generos-menu">
                    <div class="generos-fila">
                        <div class="generos-celda">
                            <a href="index.php">INICIO</a>
                        </div>
                        <div class="generos-celda activo">
                            <a href="pelis.php">PELÍCULAS</a>
                        </div>
                        <div class="generos-celda">
                            <a href="series.php">SERIES</a>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
        <!-- Inicio del pie -->
        <footer>
            <h2>© 2018 PROYECTO PERSONAL DE LA BASE DE DATOS &nbsp; - &nbsp; I. Garrote</h2>
        </footer>
        <!-- Fin del pie -->
    </div>
    <!-- Fin contenedor -->

    <script type="text/javascript">
        
        var g=document.querySelector('.generos-fila1');
        for(var i=0;i<generos.length;i++){
            g.innerHTML+='<div class="generos-celda1">';
            g.innerHTML+='<a href="?id_genero='+generos[i].id_genero+'">'+generos[i].genero;
            g.innerHTML+='</a>';
            g.innerHTML+='</div>';
    }

    </script>

</body>

</html>