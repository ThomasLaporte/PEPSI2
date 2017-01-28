<?php   include 'Class/Functions.php';

    if(isset($_GET['product'])){
      $lstFunctions = new Functions();
      $currentProduct = $lstFunctions->deleteProduct($_GET['product']);
      header("Location:http://127.0.0.1/PEPSI2-backoffice");
    }
