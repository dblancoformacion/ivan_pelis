<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Formulario</title>
    <?php include_once "almacenar.php"; ?>	<!-- <? ?> Aquí se introduce el php para que pueda ejecutarse -->
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
</head>

<body>
    <!-- Inicio del contenedor -->
    <div id="wrapper">
        <div class="formulario">
            <form action="almacenar.php" method="get" accept-charset="utf-8">
                <div class="izq">
                    <div>
                        <label for="titulo"><span class="label">Título</span>
                            <input type="text" id="titulo" name="titulo">
                        </label>
                    </div>
                    <div>
                        <label for="estreno"><span class="label">Estreno</span>
                            <input type="number" id="estreno" name="estreno" class="num">
                        </label>
                    </div>
                    <div>
                        <label for="nacionalidad"><span class="label">Nacionalidad</span>
                            <input type="text" id="nacionalidad" name="nacionalidad" class="pais">
                        </label>
                    </div>
                    <div>
                        <label for="puntuacion"><span class="label">Puntuación</span>
                            <input type="number" id="puntuacion" name="puntuacion" class="num">
                        </label>
                    </div>
                    <div>
                        <label for="vose"><span class="label">VOSE</span>
                            <input type="number" id="vose" name="vose" class="num">
                        </label>
                    </div>
                    <div>
                        <label for="vos"><span class="label">VOS</span>
                            <input type="number" id="vos" name="vos" class="num">
                        </label>
                    </div>
                    <div>
                        <label for="vista"><span class="label">Vista</span>
                            <input type="number" id="vista" name="vista" class="num">
                        </label>
                    </div>
                </div>
                <div class="der">
                    <button type="reset">Limpiar</button>
                    <button type="submit">Almacenar</button>
                    <!-- o <input type="submit" value="Almacenar"> -->
                </div>
            </form>
        </div>
    </div>
    <!-- Fin contenedor -->
</body>

</html>
