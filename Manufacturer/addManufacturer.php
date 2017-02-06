<?php   include '../Class/Functions.php'; ?>
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Ajout d'un nouveau Fournisseur</title>
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    <?php
    $lstFunctions = new Functions();

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
    {
       if($lstFunctions->addManufacturer($_POST['productName'], $_POST['productRef'], $_POST['productDesc'], $_POST['productQuantity'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'])){ // $_POST['productCateg']
         ?> <script>alert("Ajout effectué avec succés ! ");</script><?php
       }
       else {
         echo "Probleme rencontré lors de l'ajout du produit dans la bdd";
       }
    }

    $content = "<h1>Ajout d'un nouveau Fournisseur</h1>";
    $content .= "<form method=\"post\">";
    $content .= "Raison sociale: <input type=\"text\" name=\"manufacturerName\"><br>";
    $content .= "Adresse:<input type=\"text\" name=\"manufacturerAdress\"><br>";
    $content .= "Code Postal:<input type=\"text\" name=\"manufacturerPostal\"><br>";
    $content .= "Ville: <input type=\"text\" name=\"manufacturerCity\"><br>";
    $content .= "Pays:<input type=\"text\" name=\"manufacturerCountry\"><br>"; // Faire une listbox avec les pays

    $content .="<input type=\"submit\" value=\"Submit\">";
    $content .="</form>";
    echo $content;

    ?>


  </body>
  </html>
