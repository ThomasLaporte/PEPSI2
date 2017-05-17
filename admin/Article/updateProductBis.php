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
       print_r($_POST);
       foreach ($lstFunctions->getLanguages() as $language) {

         // Si des caracteristiques existent : on modifie sinon on en créer
         if(count($currentCharacteristics) > 0){
           $lstFunctions->updateCharacteristic($_GET['product'], $_POST["productDesc_".$language['id_language']], $_POST["productSpec_".$language['id_language']], $language['id_language']);
         }
         else {
           $lstFunctions->addCharacteristic($_GET['product'], $_POST["productDesc_".$language['id_language']], $_POST["productSpec_".$language['id_language']], $language['id_language'] );
         }
       }
      header("Location: lstArticles.php");
    }
?>

<div class="wrap">

<h1 class="wow fadeIn">Mise à jour produit</h1>

<section class="catalogue_products wow fadeInUp">
  <form method="post">
    <article class="catalogue_products_title back">
        <h2><?php echo $currentProduct['name']; ?></h2>

            <label>REF :</label>
            <input type="text" name="productRef" id="productRef" value="<?php echo $currentProduct['reference']; ?>">
            <label>TVA :</label>
            <input type="text" value="20%">
            <label>Prix HT :</label>
            <input type="text" name="productPrice" value="<?php echo $currentProduct['public_price']."€"; ?>">
            <label>Prix TTC :</label>
            <input type="text" value="<?php echo ((intval($currentProduct['public_price']) * 1.20)."€"); ?>">
            <label>En stock :</label>
            <input type="text" name="productQuantity" value="<?php echo $currentProduct['quantity']; ?>">
            <label>Fabriquant :</label>
            <select name="productManufacturer">
              <?php
              foreach ($lstFunctions->getManufacturers() as $manufacturer) {
                $isSelected = "";
                if($manufacturer['id_manufacturer'] == $currentProduct['manufacturer_id_manufacturer']){$isSelected = "Selected";}
                ?><option value="<?php echo $manufacturer['id_manufacturer']; ?>" <?php echo $isSelected; ?>> <?php echo $manufacturer['name']; ?></option><?php
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
                $isSelected = "";
                  if($categProduct['code'] == $currentProduct['article_category_code']){$isSelected = "Selected";}
                ?><option value="<?php echo $categProduct['code']; ?>" <?php echo $isSelected; ?>> <?php echo $categProduct['name']; ?></option><?php
              }?>
            </select>
            <label for="file" class="label-file">Choisir une image</label>
            <input id="file" name="productPicture" class="input-file" type="file">

    </article>
    <div class="catalogue_products_wrap back">
    <article class="article_products_display">
        <a href="#" class="article_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
        <div class="article_products_display_details">
          <p class="article_products_display_details_title">Nom de l'article</p>
          <input class="back_input_name" type="text" name="productName" value="<?php echo $currentProduct['name']; ?>">
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
                <textarea name="productDesc <?php echo $language['id_language']; ?>"><?php echo $description; ?></textarea>
                <p class="article_products_display_details_title">Specification : <?php echo $language['name']; ?></p>
                <textarea name="productSpec <?php echo $language['id_language']; ?>"><?php echo $specification; ?></textarea>
                <hr>
              <?php
          }?>
            <!-- <p class="article_products_display_details_title">Nom article</p>
            <input class="back_input_name" type="text" id="test" name="productName" value="<?php //echo $currentProduct['name']; ?>">
            <p class="article_products_display_details_title">Description</p>
            <textarea></textarea> -->

            <button id='button'>Modifier</button>
        </div>
    </article>
    </div>
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