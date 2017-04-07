<?php   include '../../Class/Functions.php';
        require_once '../../header.php';?>

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

//HEAD

$content = "<div class=\"wrap\">";
    $content .= "<h1 class=\"wow fadeIn\">Ajouter un produit</h1>";
    $content .= "<section class=\"catalogue_products wow fadeInUp\">";

//FORM

    $content .= "<article class=\"catalogue_products_title back\">";

    $content .= "<form method=\"post\">";
        $content .= "<label>Référence :</label><input type=\"text\" name=\"productRef\">";
        $content .= "<label>Prix HT :</label><input type=\"text\" name=\"productPrice\">";
        $content .= "<label>Quantité :</label><input type=\"number\" name=\"productQuantity\">";
        $content .= "<label>Fabricant :</label><select name=\"productManufacturer\">";
            foreach ($lstFunctions->getManufacturers() as $manufacturer) {
              $content .= "<option value=\"".$manufacturer['id_manufacturer']."\">".$manufacturer['name']."</option>";
            }
        $content .= "</select>";
        $content .= "<label>Dimensions :</label><input type=\"text\" name=\"productSize\">";
        $content .= "<label>Poids (en Kg) :</label><input type=\"number\" step=\"0.1\" name=\"productWeight\">";
        $content .= "<label>Catégorie :</label><select name=\"productCateg\" id=\"productCateg\">";
            foreach ($lstFunctions->getProductsCategs() as $categProduct) {
              $content .= "<option value=\"".$categProduct['code']."\">".$categProduct['name']."</option>";
            }
        $content .= "</select>";
        $content .= "<label for=\"file\" class=\"label-file\">Choisir une image</label><input type=\"file\" name=\"productPicture\" id=\"file\" class=\"input-file\">";

    $content .= "</form>";
    $content .= "</article>";

//DISPLAY

    $content .= "<div class=\"catalogue_products_wrap back\">";
    $content .= "<article class=\"article_products_display\">";
    $content .= "<i class=\"fa fa-cloud-upload fa-5x upload-icon\" aria-hidden=\"true\"></i>";
    $content .= "<div class=\"article_products_display_details\">";
    $content .= "<p class=\"article_products_display_details_title\">Nom article</p>";

        $content .= "<input type=\"text\" name=\"productName\"  class=\"back_input_name\">";
        $content .= "<p class=\"article_products_display_details_title\">Description</p>";
        foreach ($lstFunctions->getLanguages() as $language) {
                $content .= $language['name']." description: <textarea name=\"productDesc".$language['id_language']."\"></textarea>";
                $content .= $language['name']." specification: <textarea name=\"productSpec".$language['id_language']."\"></textarea>";
            }
        $content .= "<input type=\"submit\" class=\"upload-submit\" value=\"Ajouter\">";

    $content .= "</div>";
    $content .= "</article>";
    $content .= "</div>";
    $content .= "</section>";

$content .= "</div>";

//

    echo $content;

    ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
  </body>
  </html>
