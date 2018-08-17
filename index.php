<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, shrink-to-fit=no">
    <!-- content=width=device-width (ancho de la pantalla) (width=600 ancho de 600) initial-scale=1 (Escala inicial móvil), scalable (zoom yes or no), contraer yes or no -->
    <title>Pelis y Series</title>
    <?php 
        if(!isset($_GET['id_genero'])) $_GET['id_genero']=1;   /* Es igual que:   if(isset($_GET['id_genero'])==0) */
        include_once "libreria.php";
        if(isset($_GET['busqueda'])){                          /* Es igual que:   if(isset($_GET['busqueda'])==1) */
            sql12js('datos','pelis_series',"
                SELECT * FROM producciones
                    WHERE titulo LIKE '%".$_GET['busqueda']."%';
            ");

            sql12js('artistas','pelis_series', " SELECT * FROM (
                     SELECT id_artista,id_produccion,id_rol FROM(
                      SELECT id_produccion FROM producciones
                        WHERE titulo LIKE '%".$_GET['busqueda']."%'
                     ) c1 JOIN participan USING(id_produccion)
                    ) c2 JOIN artistas USING(id_artista)
                      JOIN roles USING(id_rol) ORDER BY rol DESC;");
        }
        else{
            sql12js('datos','pelis_series', " SELECT * FROM (
                SELECT id_produccion FROM proyecta
                    WHERE id_genero=".($_GET['id_genero']*1)."
            ) c1 JOIN producciones USING(id_produccion);  
            ");

            sql12js('artistas','pelis_series', "SELECT * FROM (
                SELECT id_artista,id_produccion,id_rol FROM(
                    SELECT id_produccion FROM proyecta WHERE id_genero=".$_GET['id_genero']."
                        ) c1 JOIN participan USING(id_produccion)
                            ) c2 JOIN artistas USING(id_artista)
                                JOIN roles USING(id_rol) ORDER BY rol DESC;");

        }

        sql12js('generos','pelis_series', " SELECT * FROM generos ORDER BY genero;");

    ?>	<!-- <? ?> Aquí se introduce el php para que pueda ejecutarse -->

    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
    <script type="text/javascript" src="js/index.js"></script>
</head>

<body>
    <!-- Inicio del contenedor -->
    <div id="wrapper">
        <header>
        	<h1>PELIS Y SERIES <img src="img/logo_rollo_mini.png"></h1>
            <p>En esta web podremos ver toda la información de las películas y series de la base de datos.</p>
            <form>
                <input type="text" name="busqueda">
                    <button class="buscar">Buscar</button>
                </input>
            </form>
            <div class="generos-menu">
            <div class="generos-fila">
            </div>
        </div>
        </header>
        <div class="generos-menu">
            <div class="generos-fila">
            </div>
        </div>
        <div class="content">

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
                    document.write(datos[i].puntuacion);
                    document.write(' , Vista: ');
                    if(datos[i].vista==1){
                        document.write('SÍ');
                    }else{
                        document.write('NO');
                    }
                    document.write('</p>');
                    document.write('<hr>');
                    document.write('<p>');
                    document.write(artistas[0].rol);
                    document.write(' : ');

                for (var j = 0; j < artistas.length; j++) {
                    if(datos[i].id_produccion==artistas[j].id_produccion){
                        document.write(artistas[j].artista);
                        document.write(' , ');
                        document.write('<p>');
                        }
                    }
                    document.write('</div>');
                    document.write('</div>');
                }

            </script>

            </div>
            <!-- <div class="noticia">
                <h3></h3>
                <p>
                    
                </p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[1].titulo)</script></h3>
                <p>
                    <script type="text/javascript">document.write(datos[1].estreno)</script>
                    <script type="text/javascript">document.write(datos[1].pais)</script>
                    <script type="text/javascript">document.write(datos[1].puntuacion)</script>
                </p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[2].titulo)</script></h3>
                <p><script type="text/javascript">document.write(datos[2].texto)</script></p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[3].titulo)</script></h3>
                <p><script type="text/javascript">document.write(datos[3].texto)</script></p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[4].titulo)</script></h3>
                <p><script type="text/javascript">document.write(datos[4].texto)</script></p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[5].titulo)</script></h3>
                <p><script type="text/javascript">document.write(datos[5].texto)</script></p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[6].titulo)</script></h3>
                <p><script type="text/javascript">document.write(datos[6].texto)</script></p>
            </div>
            <div class="noticia">
                <h3><script type="text/javascript">document.write(datos[7].titulo)</script></h3>
                <p><script type="text/javascript">document.write(datos[7].texto)</script></p>
            </div> -->
        </div>
        <!-- Inicio del pie -->
        <footer>
        	<h2>LISTADO DE PELÍCULAS Y SERIES</h2>
            <div class="tabla">
                <div class="thead">
                    <div class="celda">Título</div>
                    <div class="celda">Estreno</div>
                    <div class="celda">País</div>
                    <div class="celda">Puntuación</div>
                </div>
                <div class="fila">
                    <div class="celda1">
                        <script type="text/javascript">document.write(datos[1].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[1].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[1].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[1].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[1].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                    <div class="celda1">
                        <script type="text/javascript">document.write(datos[2].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[2].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[2].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[2].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[2].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                    <div class="celda1">
                        <script type="text/javascript">document.write(datos[3].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[3].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[3].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[3].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[3].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                    <div class="celda1">
                        <script type="text/javascript">document.write(datos[4].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[4].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[4].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[4].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[4].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                    <div class="celda1">
                        <script type="text/javascript">document.write(datos[5].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[5].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[5].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[5].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[5].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                   <div class="celda1">
                        <script type="text/javascript">document.write(datos[6].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[6].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[6].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[6].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[6].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                    <div class="celda1">
                        <script type="text/javascript">document.write(datos[7].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[7].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[7].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[7].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[7].puntuacion)</script>
                    </div>
                </div>
                <div class="fila">
                   <div class="celda1">
                        <script type="text/javascript">document.write(datos[8].id_produccion)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[8].titulo)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[8].estreno)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[8].pais)</script>
                    </div>
                    <div class="celda">
                        <script type="text/javascript">document.write(datos[8].puntuacion)</script>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Fin del pie -->
    </div>
        <!-- Fin contenedor -->

    <script type="text/javascript">
        
        var g=document.querySelector('.generos-fila');
        for(var i=0;i<generos.length;i++){
            g.innerHTML+='<div class="generos-celda">';
            g.innerHTML+='<a href="?id_genero='+generos[i].id_genero+'">'+generos[i].genero;
            g.innerHTML+='</a>';
            g.innerHTML+='</div>';
    }

    </script>

</body>

</html>