<?php   include '../../Class/Functions.php';
        require_once '../../header.php';

    $lstFunctions = new Functions();

    // Si l'utilisateur clic sur le bouton valider apres avoir fait ses modifications
    if(isset($_POST['manufacturerName']))
    {

      //print_r($lstFunctions->addManufacturer($_POST['manufacturerName'], $_POST['manufacturerAdress'], $_POST['manufacturerPostal'], $_POST['manufacturerCity'],$_POST['manufacturerCountry']));
       if($lstFunctions->addManufacturer($_POST['manufacturerName'], $_POST['manufacturerAdress'], $_POST['manufacturerPostal'], $_POST['manufacturerCity'],$_POST['manufacturerCountry'])){ // $_POST['productCateg']
          ?> <script>alert("Ajout effectué avec succés ! ");</script><?php
        }
        else {
          echo "Probleme rencontré lors de l'ajout du produit dans la bdd";
        }
      unset($_POST['manufacturerName']);
    }

    $content = "<h1>Ajout d'un nouveau Fournisseur</h1>";
    $content .= "<form method=\"post\">";
    $content .= "Raison sociale: <input type=\"text\" name=\"manufacturerName\"><br>";
    $content .= "Adresse:<input type=\"text\" name=\"manufacturerAdress\"><br>";
    $content .= "Code Postal:<input type=\"text\" name=\"manufacturerPostal\"><br>";
    $content .= "Ville: <input type=\"text\" name=\"manufacturerCity\"><br>";


    $content .= "Pays: <select name=\"manufacturerCountry\">";
    foreach ($lstFunctions->getCountries() as $country) {
      $content .= "<option value=\"".$country['id']."\">".$country['nom_en_gb']."</option>";
    }
    $content .= "</select></br>";

    $content .="<input type=\"submit\" value=\"Submit\">";
    $content .="</form>";
    echo $content;

    ?>


  </body>
  </html>
