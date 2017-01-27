<?php   include 'Class/Functions.php'; ?>
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Ajout d'un nouveau produit</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <?php
    $lstFunctions = new Functions();

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
    {
      echo "TEST" . $lstFunctions->addProduct($_POST['productName'], $_POST['productRef'], $_POST['productDesc'], $_POST['productQuantity'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'],1);
        //  if($lstFunctions->addProduct($_POST['productName'], $_POST['productRef'], $_POST['productDesc'], $_POST['productQuantity'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'],1)){ // $_POST['productCateg']
        //    echo "Ajout effectué avec succés";
        //  }
        //  else {
        //    echo "Probleme rencontré lors de l'ajout du produit dans la bdd";
         //
        //  }
    }


    $content = "<h1>Ajout d'un nouveau produit</h1>";
    $content .= "<form method=\"post\">";
    $content .= "Nom du produit: <input type=\"text\" name=\"productName\" value=\"\"><br>";
    $content .= "Réference:<input type=\"text\" name=\"productRef\" value=\"\"><br>";
    $content .= "Description: <textarea rows=\"4\" cols=\"50\" name=\"productDesc\"></textarea><br>";
    $content .= "Quantité:<input type=\"text\" name=\"productQuantity\" value=\"\"><br>";
    $content .= "Poids (en Kg): <input type=\"text\" name=\"productWeight\" value=\"\"><br>";
    $content .= "Dimensions:<input type=\"text\" name=\"productSize\" value=\"\"><br>";
    $content .= "Image: <input type=\"file\" name=\"productPicture\" value=\"\"><br>";
    $content .= "Fabricant: <select name=\"productManufacturer\">";
    foreach ($lstFunctions->getManufacturers() as $manufacturer) {
      $content .= "<option value=\"".$manufacturer['id_manufacturer']."\">".$manufacturer['name']."</option>";
    }
    $content .= "</select>";

    $content .= "Catégorie: <select name\"productCateg\">";
    foreach ($lstFunctions->getProductsCategs() as $categProduct) {
      $content .= "<option value=\"".!empty($categProduct['id_article_category'])."\">".$categProduct['name']."</option>";
    }
    $content .= "</select><br>";

    $content .="<input type=\"submit\" value=\"Submit\">";
    $content .="</form>";
    echo $content;

    ?>


  </body>
  </html>
