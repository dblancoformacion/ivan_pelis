<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>p17-formulario</title>
	<link rel="stylesheet" type="text/css" href="practica17.css">
</head>
<body>
<div class="formulario">
	<form action="almacenar.php" method="get">
		<div>
	<label for="titulo">Título</label>
	<input type="text" name="titulo" id="titulo"><br><br>
</div>
<div>
	<label type="texto" id="centrar">Texto</label>
	<textarea name="texto" id="texto" rows="10" cols="22"></textarea><br><br>
</div>
<div>
	<label type="usuario">Usuario</label>
	<input type="text" name="usuario" id="usuario">


	<button type="submit">Almacenar</button>
	<button type="reset">Limpiar</button><!--resetear formulario-->
	</div>
	</form>
</div>		
</body>
</html>