<?php
  include "../Class/Functions.php";
  require_once "../header.html";


  $lstFunctions = new Functions();
  // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
  // if(isset($_POST['productName']) &&  isset($_POST['productQuantity']))
  // {
  //    $productId = $lstFunctions->addProduct($_POST['productName'], $_POST['productRef'], $_POST['productQuantity'],$_POST['productPrice'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'], 1);
  //
  //    foreach ($languages as $language) {
  //      $lstFunctions->addCharacteristic($productId, $_POST["productDesc".$language['idlanguage']], $_POST["productSpec".$language['idlanguage']], $language['idlanguage'] );
  //    }
  //    header('Location : lstArticles.php');
  // }

  $content = "<br><h3>Ajout d'un nouveau client</h3>";

  $content .= "<form method=\"post\">";
  $content .= "Login: <input type=\"text\" name=\"customerLogin\"><br>";
  $content .= "Password:<input type=\"password\" name=\"customerPassword\"><br>";
  $content .= "Designation:<input type=\"number\" name=\"customerCompanyName\"><br>";
  $content .= "Nom du responsable: <input type=\"number\" step=\"0.1\" name=\"customerName\"><br>";
  $content .= "Téléphone:<input type=\"text\" name=\"customerPhone\"><br>";
  $content .= "Email:<input type=\"text\" name=\"customerEmail\"><br>";
  $content .= "Mobile: <input type=\"file\" name=\"customerMobile\"><br>";

  $content .= "Fax:<input type=\"text\" name=\"customerFax\"><br>";
  $content .= "Function:<input type=\"text\" name=\"customerFunction\"><br>";
  $content .= "Administrateur:<input type=\"checkbox\" name=\"customerAdmin\"><br>";

  // Ajout des caracteristiques
  $content .= "<hr>";
  foreach ($lstFunctions->getAdressTypes() as $adressType) {
    $content .= "Lieu de ".$adressType['name'];
    $content .= "Adresse de : <input type=\"text\" name=\"customerLogin\"><br>";
    $content .= "Password:<input type=\"password\" name=\"customerPassword\"><br>";
    $content .= "Designation:<input type=\"number\" name=\"customerCompanyName\"><br>";
  }

  $content .= "<br><input type=\"submit\" value=\"Ajouter article\">";
  $content .= "</form>";

  login
  password
  customer_name (entreprise)
  email
  name
  phone
  mobile
  fax
  function
  admin
