<?php   include '../../Class/Functions.php';

  if(isset($_GET['customer'])){
    $lstFunctions = new Functions();

    $lstFunctions->deleteCustomer($_GET['customer']);
    header("Location: lstCustomers.php");
  }
