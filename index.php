<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>practica17</title>
	<?php 
		if(!isset($_GET['id_genero'])) $_GET['id_genero']=1;
		include_once "libreria.php";
		if(isset($_GET['busqueda'])){
			sql2js('datos','ivan_pelis',"
				SELECT * FROM producciones
					WHERE titulo like '%".$_GET['busqueda']."%';
			");
			sql2js('artistas','ivan_pelis',"
				SELECT * FROM (
					SELECT id_artista,id_produccion FROM (
						SELECT id_produccion FROM producciones
							WHERE titulo like '%".$_GET['busqueda']."%'  
					  ) c1 JOIN participan USING(id_produccion)  
				  ) c2 JOIN artistas USING(id_artista);			
			");			
		}
		else{
			sql2js('datos','ivan_pelis',"
				SELECT * FROM (
					SELECT id_produccion FROM proyecta
						WHERE id_genero=".($_GET['id_genero']*1)."
				  ) c1 JOIN producciones USING(id_produccion);	
			"); 
			sql2js('artistas','ivan_pelis',"
				SELECT * FROM (
					SELECT id_artista,id_produccion FROM (
						SELECT id_produccion
						  FROM proyecta WHERE id_genero=".$_GET['id_genero']."  
					  ) c1 JOIN participan USING(id_produccion)  
				  ) c2 JOIN artistas USING(id_artista);		
			");			
		}
		sql2js('generos','ivan_pelis',"
			SELECT * FROM generos ORDER BY genero;		
		");

	?>
	<link rel="stylesheet" style="text/css" href="practica17.css">
	<script type="text/javascript" src="1.js"></script>
</head>
<body>

<div class="wrapper">
	
	<div class="titulo2">
		<h1><span class="rotulo">Iván Pelis</span></h1>
		<p><span class="texto2">Este es el visor de pelis de Iván
		</span></p>
	</div>

	<form>
		<input name="busqueda">
		<button>Buscar</button>
	</form>
	
	<div class="generos-menu">
		<div class="generos-fila"></div>
	</div>
	
	<div class="cuerpo">
		<script>
			for(i=0;i<datos.length;i++){
				document.write('<div>');
				document.write('<h3>');
				document.write(datos[i].titulo);
				document.write('</h3>');
				document.write('<p>');
				document.write(datos[i].nacionalidad);
				document.write('</p>');
				
				for(j=0;j<artistas.length;j++){
					if(datos[i].id_produccion==artistas[j].id_produccion){
						document.write('<p>');
						document.write(artistas[j].artista);
						document.write('</p>');
					}
				}
				
				document.write('</div>');
			}
		</script>
		
	</div>
		

	<div class="abajo">
		<h2><span class="rotulo">LISTADO DE NOTICIAS</span></h2>
		<div class="tabla">
			<div class="fila">
				<div class="negrita">Título</div>
				<div class="negrita">Texto</div>
				<div class="negrita">Usuario</div>
			</div>
			<div class="fila">
				<div>
					<script type="text/javascript">
						document.write(datos[0].titulo);
					</script>
				</div>
				<div>
					<script type="text/javascript">
						document.write(datos[0].nacionalidad);
					</script>
				</div>
				<div>
					<script type="text/javascript">
						document.write(datos[0].estreno);
					</script>
				</div>
			</div>
		</div>
	</div>
</div>	


</body>
</html>