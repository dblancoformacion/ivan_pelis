<?php
/********** PARAMETROS CONFIGURACION **********************/
	$usuario='root';
	$contra='';
	$host='127.0.0.1';
	$bbdd='practica17';
	$tabla='noticias';
	$variable='datos';
	$campos="(titulo,texto,usuario)";

/*********************************************************/

	$mysqli = new mysqli($host, $usuario, $contra, $bbdd);
	$sql="SET NAMES 'utf8'";
	$mysqli->query($sql);
	$sql = "insert into $tabla $campos values (";
	foreach($_REQUEST as $valor){
		$sql= $sql . "'" . nl2br($valor) . "',";
	}
	$sql=substr($sql, 0, -1);
	$sql.=")";
	echo $sql;
	var_dump($_REQUEST);
	$resultado = $mysqli->query($sql);
?>


