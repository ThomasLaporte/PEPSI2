<?php   include '../Class/Functions.php';

    if(isset($_GET['product'])){
      $lstFunctions = new Functions();
      $lstFunctions->deleteCharacteristic($_GET['product']);
      $lstFunctions->deleteProduct($_GET['product']);

      header("Location: lstArticles.php");
    }
