<?php   include '../Class/Functions.php';
        require_once '../header.html';

    if(isset($_GET['manufacturer']))
    {
      $lstFunctions = new Functions();

      // Si l'utilisateur clic sur le bouton valider apres avoir fait ses modifications
      if(isset($_POST["manufacturerName"]) && strlen($_POST["manufacturerName"]) > 0)
      {
          $lstFunctions->updateManufacturer($_GET['manufacturer'], $_POST['manufacturerName'], $_POST['manufacturerAdress'], $_POST['manufacturerPostal'], $_POST['manufacturerCity'], $_POST['manufacturerCountry']);
          header("Location: lstManufacturers.php");
      }
      else {
        ?> <script>alert("Veuillez renseigner l'ensemble des champs ! ");</script> <?php
        unset($_POST['manufacturerName']);
      }

      $currentManufacturer = $lstFunctions->getManufacturerById($_GET['manufacturer']);

      $content = "<h1>Modification d'un fournisseur</h1>";
      $content .= "<form method=\"post\">";
      $content .= "Raison sociale: <input type=\"text\" name=\"manufacturerName\" value=\"".$currentManufacturer['name']."\"><br>";
      $content .= "Adresse:<input type=\"text\" name=\"manufacturerAdress\" value=\"".$currentManufacturer['adress']."\"><br>";
      $content .= "Code Postal:<input type=\"text\" name=\"manufacturerPostal\" value=\"".$currentManufacturer['postal_code']."\"><br>";
      $content .= "Ville: <input type=\"text\" name=\"manufacturerCity\" value=\"".$currentManufacturer['city']."\"><br>";


      $content .= "Pays: <select name=\"manufacturerCountry\">";
      foreach ($lstFunctions->getCountries() as $country) {
        $isSelected = "";
        if($country['id'] == $currentManufacturer['country']){$isSelected = "Selected";}
        $content .= "<option value=\"".$country['id']."\" ".$isSelected.">".$country['nom_en_gb']."</option>";
      }
      $content .= "</select></br>";

      $content .="<input type=\"submit\" value=\"Valider\">";
      $content .="</form>";
      echo $content;
    }
    ?>


  </body>
  </html>
