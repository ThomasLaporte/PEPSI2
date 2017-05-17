<?php include "../../Class/Functions.php";
    $title_page = 'Spectasonic - Modifier';
    require_once "../../header.php";

    $lstFunctions = new Functions();
    $currentCateg = $lstFunctions->getProductCategByID($_GET['categ']);

    // Si le id passé dans $_GET est valide
    if(isset($_GET['categ']) && !empty($currentCateg)){

        // Vérification des champs avant update
        if(isset($_POST["updateBtn"]))
        {
          $validUpdate = 0;
          foreach ($currentCateg as $categ) {
            if(isset($_POST["categName". $categ['language_id_language']]) && strlen($_POST["categName". $categ['language_id_language']]) > 0)
            {
              $validUpdate++;
            }
          }

          // SI tous les champs NOM d'une catégorie sont OK --> UPDATE
          if($validUpdate == count($currentCateg))
          {
            foreach ($currentCateg as $categ) {
                $lstFunctions->updateProductCateg($_GET['categ'], $_POST["categName". $categ['language_id_language']], $categ['language_id_language'], $_POST["categDesc". $categ['language_id_language']]);
            }
           header("Location: lstArticleCateg.php");
          }
          else {
            ?> <script>alert("Au moins un champs NOM d'une catégorie n'est pas correctement saisie ! ");</script> <?php
          }
        }
    ?>
      <form method="post">
        <div class="wrap">

        <h1 class="wow fadeIn">Mise à jour d'une catégorie</h1>
          <section class="catalogue_products wow fadeInUp">
              <div class="catalogue_products_wrap back">
            <?php foreach ($currentCateg as $categ) {
                    $currentLanguage = $lstFunctions->getLanguageByIdBis($categ['language_id_language']);?>
                    <article class="article_products_display">
                        <div class="article_products_display_details">
                            <p class="article_products_display_details_title"><?php echo $currentLanguage['name'];?> name :</p>
                            <input name="categName<?php echo $categ['language_id_language'];?>" class="back_input_name" type="text" value="<?php echo $categ['name'];?>">
                            <p class="article_products_display_details_title"><?php echo $currentLanguage['name'];?> description :</p>
                            <textarea name="categDesc<?php echo $categ['language_id_language'];?>"><?php echo $categ['description'];?></textarea>
                        </div>
                    </article>
              <?php } ?>
                <button name="updateBtn">Modifier</button>
              </div>
          </section>
        </div>
      </form>
      <?php
    }
  else {
    header("Location: lstArticleCateg.php");
  } ?>
