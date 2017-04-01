<?php include "../Class/Functions.php";

    require_once "../header.html";
    $lstFunctions = new Functions();

    if(isset($_GET['product'])){

      // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
      if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
      {
         $lstFunctions->updateProduct($_GET['product'], $_POST['productName'], $_POST['productRef'],  $_POST['productQuantity'], $_POST['productPrice'], $_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'], '1');// $_POST['productCateg']

         foreach ($lstFunctions->getLanguages() as $language) {
          //  echo "id:".$_GET['product']."<br>";
          //  echo "desc:".$_POST["productDesc".$language['idlanguage']]."<br>";
          //  echo "spec:".$_POST["productSpec".$language['idlanguage']]."<br>";
          //  echo "lId:".$language['idlanguage']."<br>";
          $lstFunctions->updateCharacteristic($_GET['product'], $_POST["productDesc".$language['idlanguage']], $_POST["productSpec".$language['idlanguage']], $language['idlanguage']);
         }

      }

      $currentProduct = $lstFunctions->getProductByID($_GET['product']);
      $currentCharacteristics = $lstFunctions->getCharacteristicsByIdArticle($_GET['product']);


      $content = "<h1>Modification du produit</h1>";
      //$content .= "<a href=\"http://192.168.33.10\">Accueil</a>";
      $content .= "<form method=\"post\">";

      $content .= "Nom du produit: <input type=\"text\" name=\"productName\" value=\"". $currentProduct['name']."\"><br>";
      $content .= "Réference:<input type=\"text\" name=\"productRef\" value=\"". $currentProduct['reference'] ."\"><br>";
      $content .= "Quantité:<input type=\"number\" name=\"productQuantity\" value=\"". $currentProduct['quantity'] ."\"><br>";
      $content .= "Prix:<input type=\"text\" name=\"productPrice\" value=\"". $currentProduct['public_price'] ."\"><br>";
      $content .= "Poids (en Kg): <input type=\"number\" step=\"0.1\" name=\"productWeight\" value=\"". $currentProduct['weight'] ."\"><br>";
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
        if($categProduct['code'] == $currentProduct['article_category_code']){$isSelected = "Selected";}
        $content .= "<option value=\"".$categProduct['code']."\"".$isSelected.">".$categProduct['name']."</option>";
      }
      $content .= "</select><br>";


      foreach ($lstFunctions->getLanguages() as $language) {
          $currentChar = $currentCharacteristics[array_search($language['idlanguage'], array_column($currentCharacteristics, 'language_idlanguage'))];

          $content .= $language['name']." description: <textarea rows=\"4\" cols=\"50\" name=\"productDesc".$language['idlanguage']."\">".$currentChar['description']."</textarea><br><br>";
          $content .= $language['name']." specification: <textarea rows=\"4\" cols=\"50\" name=\"productSpec".$language['idlanguage']."\">".$currentChar['specification']."</textarea><br>";
          $content .="<hr>";
      }

      $content .="<input type=\"submit\" value=\"Enregistrer\">";
      $content .="</form>";
      echo $content;
    }
  else {
    //header("Location:http://127.0.0.1/PEPSI2-backoffice");
  } ?>
  </body>
</html>
