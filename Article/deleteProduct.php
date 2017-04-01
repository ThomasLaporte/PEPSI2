<?php   include '../Class/Functions.php';

    if(isset($_GET['product'])){
      $lstFunctions = new Functions();
      $lstFunctions->deleteProduct($_GET['product']);
      $lstFunctions->deleteCharacteristic($_GET['product']);
      header("Location: index.php");
    }
