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
      echo $_POST['productPicture'];
          // Si l'update a été fonctionné
        //  if($lstFunctions->updateProduct($_POST['productName'], $_POST['productPrice'])){
        //
        //  }
        //  else {
        //    # code...
        //  }
    }


    if(isset($_GET['product'])){
      $currentProduct = $lstFunctions->getProductByID($_GET['product']);
      var_dump($currentProduct);
      $content = "<h1>Modification du produit</h1>";
      $content .= "<form method=\"post\">";
      $content .= "Nom du produit: <input type=\"text\" name=\"productName\" value=\"".  $currentProduct['name']."\"><br>";
      $content .= "Réference:<input type=\"text\" name=\"productPrice\" value=\"".  $currentProduct['reference'] ."\"><br>";
      $content .= "Description: <textarea rows=\"4\" cols=\"50\" name=\"productName\">".  $currentProduct['description']."</textarea><br>";
      $content .= "Quantité:<input type=\"text\" name=\"productPrice\" value=\"".  $currentProduct['quantity'] ."\"><br>";
      $content .= "Poids (en Kg): <input type=\"text\" name=\"productName\" value=\"".  $currentProduct['weight'] ."\"><br>";
      $content .= "Dimensions:<input type=\"text\" name=\"productPrice\" value=\"".  $currentProduct['dimension'] ."\"><br>";
      $content .= "Image: <input type=\"file\" name=\"productPicture\" value=\"".  $currentProduct['picture'] ."\"><br>";
      $content .= "Fabricant: <select>";
      foreach ($lstFunctions->getManufacturers() as $manufacturer) {
        $isSelected = "";
        if($manufacturer['id_manufacturer'] == $currentProduct['manufacturer_id_manufacturer']){$isSelected = "Selected";}
        $content .= "<option value=\"".$manufacturer['id_manufacturer']."\"".$isSelected.">".$manufacturer['name']."</option>";
      }
      $content .= "</select>";

      $content .= "Catégorie: <select>";
      foreach ($lstFunctions->getProductsCategs() as $categProduct) {
        $isSelected = "";
        if($categProduct['id_article_category'] == $currentProduct['article_category_id_article_category']){$isSelected = "Selected";}
        $content .= "<option value=\"".!empty($categProduct['id_article_category'])."\"".$isSelected.">".$categProduct['name']."</option>";
      }
      $content .= "</select><br>";

      $content .="<input type=\"submit\" value=\"Submit\">";
      $content .="</form>";
      echo $content;
}
  else {
    header("Location:http://192.168.33.10/");
  } ?>
  </body>
</html>
