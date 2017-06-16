<?php
  include '../../Class/Functions.php';

  if(isset($_GET['manufacturer'])){
    $lstFunctions = new Functions();
    $lstFunctions->deleteManufacturer($_GET['manufacturer']);
  }
header("Location: lstManufacturers.php");
