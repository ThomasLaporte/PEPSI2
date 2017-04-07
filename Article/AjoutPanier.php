<?php

if(isset($_GET['product']){
	$_SESSION['Panier'] .= $_GET['product'];

};
header("Location : lstarticle_php.php");
?>