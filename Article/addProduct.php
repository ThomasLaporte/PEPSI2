<?php   include '../Class/Functions.php';
        require_once '../header.html';?>

    <?php
    $lstFunctions = new Functions();
    $languages = $lstFunctions->getLanguages();
    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']) &&  isset($_POST['productQuantity']))
    {
       $productId = $lstFunctions->addProduct($_POST['productName'], $_POST['productRef'], $_POST['productQuantity'],$_POST['productPrice'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'], 1);

       foreach ($languages as $language) {
         $lstFunctions->addCharacteristic($productId, $_POST["productDesc".$language['idlanguage']], $_POST["productSpec".$language['idlanguage']], $language['idlanguage'] );
       }
       header('Location : lstArticles.php');
    }

    $content = "<h1>Ajout d'un nouveau produit</h1>";
    $content .= "<form method=\"post\">";
    $content .= "Nom du produit: <input type=\"text\" name=\"productName\"><br>";
    $content .= "Réference:<input type=\"text\" name=\"productRef\"><br>";
    $content .= "Quantité:<input type=\"number\" name=\"productQuantity\"><br>";
    $content .= "Prix:<input type=\"text\" name=\"productPrice\"><br>";
    $content .= "Poids (en Kg): <input type=\"number\" step=\"0.1\" name=\"productWeight\"><br>";
    $content .= "Dimensions:<input type=\"text\" name=\"productSize\"><br>";
    $content .= "Image: <input type=\"file\" name=\"productPicture\"><br>";
    $content .= "Fabricant: <select name=\"productManufacturer\">";
    foreach ($lstFunctions->getManufacturers() as $manufacturer) {
      $content .= "<option value=\"".$manufacturer['id_manufacturer']."\">".$manufacturer['name']."</option>";
    }
    $content .= "</select></br>";

    $content .= "Catégorie: <select name=\"productCateg\" id=\"productCateg\">";
    foreach ($lstFunctions->getProductsCategs() as $categProduct) {
      $content .= "<option value=\"".$categProduct['code']."\">".$categProduct['name']."</option>";
    }
    // $_POST['categName'] = "TESTBIS";
    $content .= "</select><br>";

    // Ajout des caracteristiques
    foreach ($lstFunctions->getLanguages() as $language) {
        $content .= $language['name']." description: <textarea rows=\"4\" cols=\"50\" name=\"productDesc".$language['idlanguage']."\"></textarea><br><br>";
        $content .= $language['name']." specification: <textarea rows=\"4\" cols=\"50\" name=\"productSpec".$language['idlanguage']."\"></textarea><br>";
        $content .="<hr>";
    }

    $content .= "<br><input type=\"submit\" value=\"Ajouter article\">";
    $content .= "</form>";
    echo $content;

    ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="script.js"></script>
  </body>
  </html>
