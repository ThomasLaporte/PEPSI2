<?php   include 'Class/Functions.php';

    if(isset($_GET['product'])){
      $lstFunctions = new Functions();
      $currentProduct = $lstFunctions->deleteProduct($_GET['product']);
      header("Location:http://192.168.33.10");
    }
