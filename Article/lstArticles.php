<?php

$title_page = 'Spectasonic - Catalogue';
 include '../header.php';
 include "../Class/Functions.php";

  $lstFunctions = new Functions();

?>

<div class="wrap">

<h1 class="wow fadeIn">Catalogue</h1>

<!--FOREACH CATEG-->
<?php

  foreach ($lstFunctions->getProductsCategsByLang('1') as $categ) { ?>
    <section class="catalogue_products wow fadeInUp">

        <article class="catalogue_products_title">

            <h2 id="cables"> <?php echo $categ['name']; ?> </h2>
            <p> <?php echo $categ['description']; ?> </p>
        </article>
        <div class="catalogue_products_wrap">
            <?php foreach ($lstFunctions->getProductByCateg($categ['code']) as $article) {?>
              <article class="catalogue_products_display">
                  <a href="showArticle.php?product=<?php echo $article['id_article']; ?>" class="catalogue_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg"/></a>
                  <div class="catalogue_products_display_details">
                      <p class="catalogue_products_display_details_title"> <?php echo $article['name']; ?> </p>
                      <?php $articleDescription = $lstFunctions->getCharacteristicsByIdArticle($article['id_article'])[0]['description']; ?>
                      <p> <?php echo substr($articleDescription, 0, 121); ?> <a href="showArticle.php?product=<?php echo $article['id_article']; ?>">Lire la suite</a></p>
                  </div>
              </article>
              <?php
            }
            ?>
        </div>
    </section>
<?php } ?>
</div>

<?php
  include '../footer.php';
?>
