<?php
  require_once '../Class/Functions.php';

  if(isset($_GET['manufacturer'])){
    $lstFunctions = new Functions();
    if($currentmanufacturer = $lstFunctions->deleteManufacturer($_GET['manufacturer']) == true){
        header("Location:http://192.168.33.10");
    }
    else {
      echo "Une erreur a été rencontrée lors de la suppression du fournisseur";
    }

  }
