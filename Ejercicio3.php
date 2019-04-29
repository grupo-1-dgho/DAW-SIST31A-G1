<?php
include_once("menu.php")
  ?>
<!DOCTYPE HTML>
<html>
<head><title></title>
<meta charset="utf-8">
</head>
<style type="text/css">
	form{
		background-color: black;
		color: white;
		width: 70%;
		border-radius: 20px;
		padding: 10px;
		box-sizing: border-box;
		border:3px solid red;
	}
	.boton{
		background-color: red;
		color: white;
		border-radius: 20px;
		width: 60px;
	}
.boton:hover{
	background-color: green;
}
body{
	background-image: url(fondo.jpg);
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}
article{
	width: 50%;
	background-color: rgba(0,0,0,0.5);
	border-radius: 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 20px;
	border:3px solid red;
}
article:hover{
	background-color: skyblue;
}
</style>
<body><br><br><br>

	<?php 
	$n=" ";
if (isset($_POST["enviar"]) && !empty($_POST["enviar"])){
	$n=$_POST["alumnos"];
	$i=1;
	if ($n>0) {
		echo "<form method=post>";
		while ($i<=$n) {
			echo "Nombre del estudiante $i:&nbsp;<input type=text name=nombre[] validated>&nbsp;&nbsp;";
			echo "Nota de la materia:&nbsp;<input type=number name=nota[] validated><br><br>";
			$i++;

		}echo "<input type='Submit' name='enviar2' class='boton'><br><br></form>";

		
	}else{echo "Debe ingrear un número mayor a 0";
echo "<form method=post>
	Cantidad de Alumnos a Ingresar:<br>
	<input type='number' name='alumnos'><br><br>
	<input type='Submit' name='enviar' class='boton'><br><br></form>";}
}
elseif(isset($_POST["enviar2"]) && !empty($_POST["enviar2"])){

	$nombre=$_POST["nombre"];
$nota=$_POST["nota"];
$contar=count($nota);
$suma=0;
echo "<article>";
for($i=0;$i<$contar;$i++){
	echo "Estudiante: $nombre[$i] &nbsp;&nbsp;Nota: $nota[$i]<br>";
	$suma=$suma+$nota[$i];
}
echo "El promedio es: ".$suma/$contar;
echo "</article>";
}

else{
echo "<form method=post>
	Cantidad de Alumnos a Ingresar:<br>
	<input type='number' name='alumnos'><br><br>
	<input type='Submit' name='enviar' class='boton'><br><br></form>";

}

	 ?>


</body>
</html>
