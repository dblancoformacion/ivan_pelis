<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <!-- content=width=device-width (ancho de la pantalla) (width=600 ancho de 600) initial-scale=1 (Escala inicial móvil), scalable (zoom yes or no), contraer yes or no -->
    <title>Pelis y Series de Iván</title>
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
                SELECT DISTINCT id_produccion FROM proyecta
                    -- WHERE id_genero=".($_GET['id_genero']*1)."
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
</head>

<body>
    <!-- Inicio del contenedor -->
    <div id="wrapper">
        <header>
            <h1>PELIS Y SERIES <img src="img/logo_rollo.png"></h1>
            <p>En esta web podremos ver toda la información de las películas y series de Iván.</p>
            <form>
                <input type="text" name="busqueda">
                    <button class="buscar">Buscar</button>
                </input>
            </form>
            <div class="menu2">
                <div class="menu-izq">
                    <menu>
                        <div class="generos-menu1">
                            <div class="generos-fila1">
                                <div class="generos-celda1">
                                    <a href="pelis.php">PELÍCULAS</a>
                                </div>
                            </div>
                        </div>
                    </menu>
                </div>
                <div class="menu-der">
                    <menu>
                        <div class="generos-menu">
                            <div class="generos-celda">
                                <a href="series.php">SERIES</a>
                            </div>
                    </div>
                    </menu>
                </div>
            </div>
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
                        document.write('</p>');
                        document.write('</div>');
                        document.write('</div>');
                    }

                </script>

            <?php
            ?>

                <!-- for ($i = 0; $i < strlen($datos); $i++) {
                    echo ('<div class="producciones1">');
                    echo ('<div>');
                    echo ('<h3>');
                    echo($datos[$i].$titulo);
                    echo('</h3>');
                    echo('<hr>');
                    echo('<p>');
                    echo($datos[$i].$estreno);
                    echo(' , País: ');
                    echo($datos[$i].$pais);
                    echo(' , Puntuación: ');
                    if($datos[i].$puntuacion==0){
                            echo(' - ');
                        }else{
                            echo($datos[i].$puntuacion);
                        }
                    echo(' , Vista: ');
                    if($datos[$i].$vista==1){
                        echo('SÍ');
                    }else{
                        echo('NO');
                    }
                    echo('</p>');
                    echo('</div>');
                    echo('</div>');
                } -->

            <?php
            ?>


            </div>
            </article>
            <nav>
                <!-- <menu>
                    <div class="generos-menu1">
                        <div class="generos-fila1">
                            <div class="generos-celda1">
                                <a href="pelis.php">PELÍCULAS</a>
                            </div>
                        </div>
                    </div>
                </menu> -->
                <?php

                    sql12js('datos','ivan_pelis', " SELECT * FROM producciones LEFT JOIN (
            SELECT DISTINCT id_produccion FROM temporadas
                ) c1 USING(id_produccion) WHERE c1.id_produccion IS NULL ORDER BY titulo;;");

                ?>
                <script type="text/javascript">

                    for (var i = 0; i < datos.length; i++) {
                        document.write('<div class="producciones">');
                        document.write('<div>');
                        document.write('<h3>');
                        document.write(datos[i].titulo);
                        document.write('</h3>');
                        document.write('<hr>');
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
                        document.write('</div>');
                        document.write('</div>');
                    }

                </script>

            </nav>
            <aside>
                <!-- <menu>
                    <div class="generos-menu">
                        <div class="generos-celda">
                            <a href="series.php">SERIES</a>
                        </div>
                    </div>
                </menu> -->
                
                <?php

        sql12js('datos','ivan_pelis', " SELECT * FROM producciones LEFT JOIN (
            SELECT DISTINCT id_produccion FROM temporadas
                ) c1 USING(id_produccion) WHERE c1.id_produccion IS NOT NULL ORDER BY titulo;;");

                ?>

                <script type="text/javascript">

                    for (var i = 0; i < datos.length; i++) {
                        document.write('<div class="producciones">');
                        document.write('<div>');
                        document.write('<h3>');
                        document.write(datos[i].titulo);
                        document.write('</h3>');
                        document.write('<hr>');
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
                        document.write('</div>');
                        document.write('</div>');
                    }

                </script>

            </aside>
        </div>
        <footer>
            <h2>© 2018 PROYECTO PERSONAL DE LA BASE DE DATOS &nbsp; - &nbsp; I. Garrote</h2>
        </footer>
    </div>
    <!-- Fin contenedor -->
</body>

</html>