<?php   include 'Class/Functions.php';
        require_once 'header.php';?>
<!-- <!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Ajout d'un nouveau produit</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body> -->
    <?php
    $lstFunctions = new Functions();

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
    {

       if($lstFunctions->addProduct($_POST['productName'], $_POST['productRef'], $_POST['productDesc'], $_POST['productQuantity'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'])){ // $_POST['productCateg']
         ?> <script>alert("Ajout effectué avec succés ! ");</script><?php
        }
      //  else {
      //    echo "Probleme rencontré lors de l'ajout du produit dans la bdd";
      //  }
    }

    $content = "<h1>Ajout d'un nouveau produit</h1>";
    $content .= "<form method=\"post\">";
    $content .= "Nom du produit: <input type=\"text\" name=\"productName\"><br>";
    $content .= "Réference:<input type=\"text\" name=\"productRef\"><br>";
    $content .= "Description: <textarea rows=\"4\" cols=\"50\" name=\"productDesc\"></textarea><br>";
    $content .= "Quantité:<input type=\"text\" name=\"productQuantity\"><br>";
    $content .= "Poids (en Kg): <input type=\"text\" name=\"productWeight\"><br>";
    $content .= "Dimensions:<input type=\"text\" name=\"productSize\"><br>";
    $content .= "Image: <input type=\"file\" name=\"productPicture\"><br>";
    $content .= "Fabricant: <select name=\"productManufacturer\">";
    foreach ($lstFunctions->getManufacturers() as $manufacturer) {
      $content .= "<option value=\"".$manufacturer['id_manufacturer']."\">".$manufacturer['name']."</option>";
    }
    $content .= "</select></br>";

    $content .= "Catégorie: <select name=\"productCateg\" id=\"productCateg\">";
    foreach ($lstFunctions->getProductsCategs() as $categProduct) {
      $content .= "<option value=\"".$categProduct['id_article_category']."\">".$categProduct['name']."</option>";
    }
    $_POST['categName'] = "TESTBIS";
    $content .= "</select>";
    //<input type=\"text\" name=\"categName\" id = \"categName\" placeholder=\"Nom categorie\">  <button id=\"addProductCateg\">Ajout</button></br>";//<a href=\"addProductCateg.php?categName=\"".$_POST['categName']."\">Ajout categorie</a><br>";

    // Ajout datalist
    // $content .= "Catégorie: <input list=\"productCateg\"><datalist name=\"productCateg\">";
    // foreach ($lstFunctions->getProductsCategs() as $categProduct) {
    //   $content .= "<option id=\"".$categProduct['id_article_category'] ."\" value=\"".$categProduct['name']."\"></option>";
    // }
    //   $content .= "</datalist></br>";

    $content .= "<input id=\"addProductCateg\" type=\"text\"><a href=\"addProductCateg.php\">Ajouter catégorie</a></input>";
    $content .= "<input type=\"submit\" value=\"Submit\">";
    $content .= "</form>";
    echo $content;

    ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="script.js"></script>
  </body>
  </html>
