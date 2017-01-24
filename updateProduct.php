<?php   include 'Class/Functions.php'; ?>
<!DOCTYPE html>
<html>
  <head>
    <title> Modifier produit </title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <?php
    $lstFunctions = new Functions();

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']))
    {
          // Si l'update a été fonctionné
         if($lstFunctions->updateProduct($_POST['productName'], $_POST['productPrice'])){

         }
         else {
           # code...
         }
    }


    if(isset($_GET['product'])){
      $currentProduct = $lstFunctions->getProductByID($_GET['product']);
      $content = "";

      $content .= "<form method=\"post\">";
      $content .= "Nom du produit: <input type=\"text\" name=\"productName\" placeholder=\"".  $currentProduct['name']."\"><br>";
      $content .= "Réference:<input type=\"text\" name=\"productPrice\" placeholder=\"".  $currentProduct['name'] ."\"><br>";
      $content .= "Description: <input type=\"text\" name=\"productName\" placeholder=\"".  $currentProduct['name'] ."\"><br>";
      $content .= "Quantité:<input type=\"text\" name=\"productPrice\" placeholder=\"".  $currentProduct['name'] ."\"><br>";
      $content .= "Poids (en Kg): <input type=\"text\" name=\"productName\" placeholder=\"".  $currentProduct['name'] ."\"><br>";
      $content .= "Dimensions:<input type=\"text\" name=\"productPrice\" placeholder=\"".  $currentProduct['name'] ."\"><br>";
      $content .= "Image: <input type=\"file\" name=\"productName\" placeholder=\"".  $currentProduct['name'] ."\"><br>";
      $content .= "Fabricant: <select>";
      foreach ($lstFunctions->getManufacturers() as $manufacturer) {
        $content .= "<option value=".$manufacturer['id_manufacturer'].">".$manufacturer['name']."</option>";
      }
      $content .= "</select>";

      $content .= "Catégorie: <select>";
      $test = $lstFunctions->getProductsCategs();
      print_r($test);

      foreach ($lstFunctions->getProductsCategs() as $categProduct) {
        $content .= "<option value=".!empty($categProduct['id_article_category']).">".$categProduct['name']."</option>";
      }
      $content .= "</select>";

      $content .="<input type=\"submit\" value=\"Submit\">";
      $content .="</form>";
      echo $content;
}
  else {
    header("Location:http://192.168.33.10/");
  } ?>
  </body>
</html>
