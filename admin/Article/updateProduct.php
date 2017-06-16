<?php
$title_page = 'Spectasonic - Modifier';
require_once "../../header.php";

include "../../Class/Functions.php";


  if(isset($_GET['product'])){
    $lstFunctions = new Functions();
    $currentProduct = $lstFunctions->getProductByID($_GET['product']);
    $currentCharacteristics = $lstFunctions->getCharacteristicsByIdArticle($_GET['product']);

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
    {
      if(!isset($_POST['productRef'])) $_POST['productRef'] = 'NULL';
      if(!isset($_POST['productPrice'])) $_POST['productPrice'] = 'NULL';
      if(!isset($_POST['productWeight']) || $_POST['productWeight'] == '') $_POST['productWeight'] = '0';
      if(!isset($_POST['productSize'])) $_POST['productSize'] = 'NULL';
      if(!isset($_POST['productPicture'])) $_POST['productPicture'] = 'NULL';

       $lstFunctions->updateProduct($_GET['product'], $_POST['productName'], $_POST['productRef'],  $_POST['productQuantity'], str_replace("€","",$_POST['productPrice']), $_POST['productWeight'], $_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'], '1');
       foreach ($lstFunctions->getLanguages() as $language) {

         // Si des caracteristiques existent : on modifie sinon on en créer
         if(count($currentCharacteristics) > 0){
           $lstFunctions->updateCharacteristic($_GET['product'], $_POST["productDesc".$language['id_language']], $_POST["productSpec".$language['id_language']], $language['id_language']);
         }
         else {
           $lstFunctions->addCharacteristic($_GET['product'], $_POST["productDesc".$language['id_language']], $_POST["productSpec".$language['id_language']], $language['id_language'] );
         }
       }
      header("Location: lstArticles.php");
    }
?>

<div class="wrap">

<h1 class="wow fadeIn">Mise à jour produit</h1>

<section class="catalogue_products wow fadeInUp">
  <form method="post" class="form-product">
    <article class="catalogue_products_title back">
        <h2><?php echo $currentProduct['name']; ?></h2>

            <label>REF :</label>
            <input type="text" name="productRef" id="productRef" value="<?php echo $currentProduct['reference']; ?>">
            <label>TVA :</label>
            <input type="text" value="20%">
            <label>Prix HT :</label>
            <input type="text" name="productPrice" required value="<?php echo $currentProduct['public_price']."€"; ?>">
            <label>En stock :</label>
            <input type="text" name="productQuantity" required value="<?php echo $currentProduct['quantity']; ?>">
            <label>Fabriquant :</label>
            <select name="productManufacturer">
              <?php
              foreach ($lstFunctions->getManufacturers() as $manufacturer) {
                ?><option value="<?php echo $manufacturer['id_manufacturer']; ?>" <?php echo (($manufacturer['id_manufacturer'] == $currentProduct['manufacturer_id_manufacturer'])? "Selected" : ""); ?>> <?php echo $manufacturer['name']; ?></option><?php
              }?>
            </select>
            <label>Dimensions :</label>
            <input type="text" name="productSize" value="<?php echo $currentProduct['dimension']; ?>">
            <label>Poids :</label>
            <input type="text" name="productWeight" value="<?php echo $currentProduct['weight']; ?>">

            <label>Catégorie :</label>
            <select name="productCateg">
              <?php
              foreach ($lstFunctions->getProductsCategsByLang(1) as $categProduct) {
                ?><option value="<?php echo $categProduct['code']; ?>" <?php echo (($categProduct['code'] == $currentProduct['article_category_code'])? "Selected" : ""); ?>> <?php echo $categProduct['name']; ?></option><?php
              }?>
            </select>
            <label for="file" class="label-file">Choisir une image</label>
            <input id="file" name="productPicture" class="input-file" type="file">


        <a href="#" class="article_img_link_bis"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
        <div class="article_products_display_details">
          <p class="article_products_display_details_title">Nom de l'article</p>
          <input class="back_input_name" required type="text" name="productName" value="<?php echo $currentProduct['name']; ?>">
          <?php foreach ($lstFunctions->getLanguages() as $language) {
              $specification = "";
              $description = "";

              if(count($currentCharacteristics)>0){
                $currentChar = $currentCharacteristics[array_search($language['id_language'], array_column($currentCharacteristics, 'language_id_language'))];
                $description = $currentChar['description'];
                $specification = $currentChar['specification'];
              }
              ?>

                <p class="article_products_display_details_title">Description : <?php echo $language['name']; ?></p>
                <textarea name="productDesc<?php echo $language['id_language']; ?>"><?php echo $description; ?></textarea>
                <p class="article_products_display_details_title">Specification : <?php echo $language['name']; ?></p>
                <textarea name="productSpec<?php echo $language['id_language']; ?>"><?php echo $specification; ?></textarea>
                <hr>
              <?php
          }?>

            <button id='button'>Modifier</button>
    </article>
  </form>

</section>

</div>
<?php
  }
  else {
    header("Location: lstArticles.php");
  }
include '../../footer.php';
?>
