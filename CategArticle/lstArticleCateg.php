<?php

$title_page = 'Spectasonic - Back office';
include '../header.php';
include "../Class/Functions.php";
$lstFunctions = new Functions();
?>

<div class="wrap">

<h1 class="wow fadeIn">Back office</h1>
<?php foreach ($lstFunctions->getProductsCategsByLang('1') as $categ) { ?>

  <section class="catalogue_products wow fadeInUp">
      <article class="catalogue_products_title">
          <h2><?php echo $categ['name']; ?></h2>
          <!-- <p>Consultez et modifiez la liste des produits</p> -->
      </article>
      <div class="catalogue_products_wrap">
      <article class="article_products_display">
          <a href="showArticleCateg.php?categ=<?php echo $categ['code']; ?>" class="article_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
          <div class="article_products_display_details">
              <p class="article_products_display_details_title"><?php echo $categ['name']; ?></p>
              <p><?php echo $categ['description']; ?></p>
              <a href="showArticleCateg.php?categ=<?php echo $categ['code']; ?>"><button>Voir</button></a>
          </div>
      </article>
      </div>
  </section>
<?php } ?>


</div>

<?php

include '../footer.php';

?>
