<?php   include '../../Class/Functions.php';

    if(isset($_GET['customer'])){
      $lstFunctions = new Functions();
      $lstFunctions->deleteCustomerPrice($_GET['customer'], $_GET['article']);
    }
    header("Location: customerReductions.php?customer=".$_GET['customer']);
