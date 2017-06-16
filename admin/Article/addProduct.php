<?php
$title_page = 'Spectasonic - Ajout';
require_once "../../header.php";

include "../../Class/Functions.php";

    $lstFunctions = new Functions();
    $languages = $lstFunctions->getLanguages();

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']) && $_POST['productName'] != "" && $_POST['productQuantity'])
    {
      if(!isset($_POST['productRef'])) $_POST['productRef'] = 'NULL';
      if(!isset($_POST['productPrice'])) $_POST['productPrice'] = 'NULL';
      if(!isset($_POST['productWeight']) || $_POST['productWeight'] == '') $_POST['productWeight'] = '0';
      if(!isset($_POST['productSize'])) $_POST['productSize'] = 'NULL';
      if(!isset($_POST['productPicture'])) $_POST['productPicture'] = 'NULL';


      $productId = $lstFunctions->addProduct($_POST['productName'], $_POST['productRef'], $_POST['productQuantity'],$_POST['productPrice'],$_POST['productWeight'],$_POST['productSize'],$_POST['productPicture'],$_POST['productManufacturer'], $_POST['productCateg'], 1);
      foreach ($languages as $language) {
        $lstFunctions->addCharacteristic($productId,
                                        (isset($_POST["productDesc".$language['id_language']]))? 	$_POST["productDesc".$language['id_language']] : "",
                                        (isset($_POST["productSpec".$language['id_language']]))? 	$_POST["productSpec".$language['id_language']] : "",
                                        $language['id_language'] );
      }
    }
?>

<div class="wrap">

<h1 class="wow fadeIn">Ajout d'un produit</h1>

<section class="catalogue_products wow fadeInUp">
  <form method="post" class="form-product">
    <article class="catalogue_products_title back">

            <label>REF :</label>
            <input type="text" name="productRef" id="productRef" value="">
            <label>TVA :</label>
            <input type="text" value="20%">
            <label>Prix HT :</label>
            <input type="text" required name="productPrice" value="">
            <label>En stock :</label>
            <input type="text" required name="productQuantity" value="">
            <label>Fabriquant :</label>
            <select name="productManufacturer">
              <?php
              foreach ($lstFunctions->getManufacturers() as $manufacturer) {?>

                <option value="<?php echo $manufacturer['id_manufacturer']; ?>"> <?php echo $manufacturer['name']; ?></option>
              <?php } ?>
            </select>
            <label>Dimensions :</label>
            <input type="text" name="productSize" value="">
            <label>Poids :</label>
            <input type="text" name="productWeight" value="">

            <label>Catégorie :</label>
            <select name="productCateg">
              <?php
              foreach ($lstFunctions->getProductsCategsByLang(1) as $categProduct) {
                ?><option value="<?php echo $categProduct['code']; ?>"> <?php echo $categProduct['name']; ?></option><?php
              }?>
            </select>
            <label for="file" class="label-file">Choisir une image</label>
            <input id="file" name="productPicture" class="input-file" type="file">


        <a href="#" class="article_img_link_bis"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
          <p class="article_products_display_details_title">Nom de l'article</p>
          <input class="back_input_name" required type="text" name="productName" value="">
          <?php foreach ($languages as $language) {?>
                <h3><?php echo $language['name'];?></h3>
                <p class="article_products_display_details_title">Description : <?php echo $language['name']; ?></p>
                <textarea name="productDesc<?php echo $language['id_language']; ?>"></textarea>
                <p class="article_products_display_details_title">Specification : <?php echo $language['name']; ?></p>
                <textarea name="productSpec<?php echo $language['id_language']; ?>"></textarea>
                <hr>
              <?php
          }?>

            <button id='button'>Ajouter</button>
      </article>
  </form>
</section>

</div>
<?php
include '../../footer.php';
?>
