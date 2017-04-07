<?php   include '../Class/Functions.php';


  if(isset($_GET['manufacturer'])){
    $lstFunctions = new Functions();
    if($currentmanufacturer = $lstFunctions->deleteManufacturer($_GET['manufacturer']) == true){
        header("Location: lstManufacturers.php");
    }
    else {
      echo "Une erreur a été rencontrée lors de la suppression du fournisseur";
    }

  }
