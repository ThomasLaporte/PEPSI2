<?php
  include "../Class/Functions.php";
  require_once "../header.html";


  $lstFunctions = new Functions();
  // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
  if(isset($_POST['submit'])) // si il existe et n'est pas vide
  {
      $isAdmin = 0;
      if(isset($_POST['customerAdmin'])){$isAdmin = 1;}
      $lstFunctions->addCustomer($_POST['customerLogin'], sha1($_POST['customerPassword']), $_POST['customerCompanyName'],$_POST['customerName'],$_POST['customerEmail'],
                                 $_POST['customerPhone'], $_POST['customerMobile'], $_POST['customerFax'], $_POST['customerFunction'], $isAdmin);

      // foreach ($lstLanguages as $language) {
      //     $lstFunctions->addArticleCategorie($_POST['categName'.$language['idlanguage']], $codeValue, $language['idlanguage'], $_POST['productDesc'.$language['idlanguage']]);
      // }


  }

  $content = "<br><h3>Ajout d'un nouveau client</h3>";

  $content .= "<form method=\"post\">";
  $content .= "Login: <input type=\"text\" name=\"customerLogin\" required><br>";
  $content .= "Password:<input type=\"text\" name=\"customerPassword\" required><br>";
  $content .= "Designation:<input type=\"text\" name=\"customerCompanyName\" required><br>";
  $content .= "Nom du responsable: <input type=\"text\" name=\"customerName\" required><br>";
  $content .= "Téléphone:<input type=\"number\" name=\"customerPhone\" maxlength=\"10\" required><br>";
  $content .= "Mobile: <input type=\"number\" name=\"customerMobile\" maxlength=\"10\" required><br>";
  $content .= "Fax:<input type=\"number\" name=\"customerFax\" maxlength=\"10\"><br>";
  $content .= "Email:<input type=\"email\" name=\"customerEmail\" required><br>";

  $content .= "Function:<input type=\"text\" name=\"customerFunction\"><br>";
  $content .= "Administrateur:<input type=\"checkbox\" name=\"customerAdmin\" required><br>";

  // Ajout des caracteristiques
  $content .= "<hr>";
  foreach ($lstFunctions->getAdressTypes() as $adressType) {
    $content .= "Lieu de ".$adressType['name'];
    $content .= "Adresse de ".$adressType['name'].": <input type=\"text\" name=\"customerAdress".$adressType['name']."\" required><br>";
    $content .= "Code postal de ".$adressType['name'].":<input type=\"text\" name=\"customerPostal".$adressType['name']."\" required><br>";
    $content .= "Ville de ".$adressType['name'].":<input type=\"text\" name=\"customerCity".$adressType['name']."\" required><br>";


    $content .= "Pays: <select name=\"manufacturerCountry".$adressType['name']."\">";
    foreach ($lstFunctions->getCountries() as $country) {
      $content .= "<option value=\"".$country['id']."\">".$country['nom_fr_fr']."</option>";
    }
    $content .= "</select></br>";
  }

  $content .= "<br><input type=\"submit\" name=\"submit\" value=\"Ajouter client\">";
  $content .= "</form>";

  echo $content;
