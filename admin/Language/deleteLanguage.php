<?php
include '../../Class/Functions.php';

    if(isset($_GET['lang'])){
      $lstFunctions = new Functions();
      $currentProduct = $lstFunctions->deleteLanguage($_GET['lang']);

    }
header("Location: ../Language/lstLanguages.php");
