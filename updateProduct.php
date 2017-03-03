<?php include "Class/Functions.php";

    require_once "header.php";
    $lstFunctions = new Functions();

    if(isset($_GET['product'])){

      // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
      if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
      {
         if($lstFunctions->updateProduct($_GET['product'], $_POST['productName'], $_POST['productRef'], $_POST['productDesc'], $_POST['productQuantity'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'])){ // $_POST['productCateg']
           ?> <script>alert("MAJ effectué avec succés ! ");</script><?php
         }
         else {
           echo "Probleme rencontré lors de l'update";
         }
      }

      $currentProduct = $lstFunctions->getProductByID($_GET['product']);

      $content = "<h1>Modification du produit</h1>";
      $content .= "<a href=\"http://192.168.33.10\">Accueil</a>";
      $content .= "<form method=\"post\">";
      $content .= "Nom du produit: <input type=\"text\" name=\"productName\" value=\"". $currentProduct['name']."\"><br>";
      $content .= "Réference:<input type=\"text\" name=\"productRef\" value=\"". $currentProduct['reference'] ."\"><br>";
      $content .= "Description: <textarea rows=\"4\" cols=\"50\" name=\"productDesc\">". $currentProduct['description']."</textarea><br>";
      $content .= "Quantité:<input type=\"text\" name=\"productQuantity\" value=\"". $currentProduct['quantity'] ."\"><br>";
      $content .= "Poids (en Kg): <input type=\"text\" name=\"productWeight\" value=\"". $currentProduct['weight'] ."\"><br>";
      $content .= "Dimensions:<input type=\"text\" name=\"productSize\" value=\"". $currentProduct['dimension'] ."\"><br>";
      $content .= "Image: <input type=\"file\" name=\"productPicture\" value=\"". $currentProduct['picture'] ."\"><br>";
      $content .= "Fabricant: <select name=\"productManufacturer\">";
      foreach ($lstFunctions->getManufacturers() as $manufacturer) {
        $isSelected = "";
        if($manufacturer['id_manufacturer'] == $currentProduct['manufacturer_id_manufacturer']){$isSelected = "Selected";}
        $content .= "<option value=\"".$manufacturer['id_manufacturer']."\"".$isSelected.">".$manufacturer['name']."</option>";
      }
      $content .= "</select>";

      $content .= "Catégorie: <select name=\"productCateg\">";
      foreach ($lstFunctions->getProductsCategs() as $categProduct) {
        $isSelected = "";
        if($categProduct['id_article_category'] == $currentProduct['article_category_id_article_category']){$isSelected = "Selected";}
        $content .= "<option value=\"".$categProduct['id_article_category']."\"".$isSelected.">".$categProduct['name']."</option>";
      }
      $content .= "</select><br>";

      $content .="<input type=\"submit\" value=\"Submit\">";
      $content .="</form>";
      echo $content;
    }
  else {
    //header("Location:http://127.0.0.1/PEPSI2-backoffice");
  } ?>
  </body>
</html>
