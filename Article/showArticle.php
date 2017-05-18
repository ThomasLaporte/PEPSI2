<?php
  $title_page = 'Spectasonic - Article';
  include '../header.php';
  include "../Class/Functions.php";

  $lstFunctions = new Functions();
  $currentProduct = $lstFunctions->getProductByID($_GET['product']);

  // Gestion de l'ajout au panier
  if(isset($_POST['ajoutPanier']))
  {
    if(isset($_SESSION['panier'][$_GET['product']]))
    {
      $_SESSION['panier'][$_GET['product']] += 1;
    }
    else {
      $_SESSION['panier'][$_GET['product']] = 1;
    }
    unset($_POST['ajoutPanier']);
  }

?>

<div class="wrap">

<h1 class="wow fadeIn">Article</h1>
<form method="post">
  <section class="catalogue_products wow fadeInUp">
      <article class="catalogue_products_title back">
          <h2><?php echo $currentProduct['name']; ?></h2>
          <ul>
              <li>REF : <?php echo $currentProduct['reference']; ?></li>
              <li>TVA : 20%</li>
              <li>Prix HT : <?php echo $currentProduct['public_price']."€"; ?></li>
              <li>Prix TTC : <?php echo ((intval($currentProduct['public_price']) * 1.20)."€"); ?></li>
              <li>En stock : <?php echo $currentProduct['quantity']; ?></li>
              <li>Fabriquant : <?php echo $lstFunctions->getManufacturerById($currentProduct['manufacturer_id_manufacturer'])['name']; ?></li>
              <li>Dimension : <?php echo $currentProduct['dimension']; ?></li>
              <li>Poids : <?php echo $currentProduct['weight']; ?></li>
              <li>Catégorie : <a href="../CategArticle/showCateg.php?categ=<?php echo $currentProduct['article_category_code']; ?>"><?php echo $lstFunctions->getProductCategByID($currentProduct['article_category_code'])[0]['name']; ?></a></li>
          </ul>
          <!-- <a href="ajout.php"><i class="fa fa-times fa-2x a_delete" aria-hidden="true"></i></a> -->
      </article>
      <div class="catalogue_products_wrap">
      <article class="article_products_display">
          <a class="article_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
          <div class="article_products_display_details">
              <p class="article_products_display_details_title"><?php echo $currentProduct['name']; ?></p>
              <p><?php echo $lstFunctions->getCharacteristicsByIdArticle($currentProduct['id_article'])[0]['description']; ?></p>
              <p><?php echo $lstFunctions->getCharacteristicsByIdArticle($currentProduct['id_article'])[0]['specification']; ?></p>
          </div>
          <input type="submit" class="upload-submit" value="Ajouter au panier" name="ajoutPanier">
      </article>
      </div>
  </section>
</form>
</div>

<?php
include '../footer.php';
?>
