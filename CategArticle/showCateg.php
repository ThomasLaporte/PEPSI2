<?php
  $title_page = 'Spectasonic - Categorie';
  include '../header.php';
  include "../Class/Functions.php";

  $lstFunctions = new Functions();
  if(isset($_GET['categ'])){
      $currentCateg = $lstFunctions->getProductCategByID($_GET['categ'])[0];
    ?>

      <div class="wrap">
        <h1 class="wow fadeIn">Catégorie</h1>
        <section class="catalogue_products wow fadeInUp">
            <article class="catalogue_products_title back">
                <h2><?php echo $currentCateg['name']; ?></h2>

                <!-- <a href="ajout.php"><i class="fa fa-times fa-2x a_delete" aria-hidden="true"></i></a> -->
            </article>
            <div class="catalogue_products_wrap">
              <article class="article_products_display">
                  <a class="article_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
                  <div class="article_products_display_details">
                      <p class="article_products_display_details_title"><?php echo $currentCateg['name']; ?></p>
                      <p><?php echo $currentCateg['description']; ?></p>
                  </div>
              </article>
            </div>
        </section>
      </div>

    <?php
}
else {
  header("Location: lstCategs.php");
}
  include '../footer.php';
?>
