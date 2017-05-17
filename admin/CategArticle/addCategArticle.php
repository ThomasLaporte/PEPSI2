<?php
  include '../../Class/Functions.php';
  $title_page = 'Spectasonic - Backoffice';
  require_once '../../header.php';

    $lstFunctions = new Functions();
    $lstLanguages = $lstFunctions->getLanguages();
    $isComplete = true;
    if(isset($_POST['AddBtn'])) // si il existe et n'est pas vide
    {
      foreach ($lstLanguages as $language) {
          if(!isset($_POST['categName'.$language['id_language']])){
            $isComplete = false;
          }
      }

      if($isComplete == true){
        $codeValue = intval($lstFunctions->getMaxCodeFromCategProd()['MAX(code)']) +1;

        foreach ($lstLanguages as $language) {
            $lstFunctions->addArticleCategorie($_POST['categName'.$language['id_language']], $codeValue, $language['id_language'], $_POST['categDesc'.$language['id_language']]);
        }
        ?><script>alert("Ajout de la cétgorie effectué avec succés ! ");</script><?php
      }
      else {
        ?><script>alert("Veuillez vérifier que le nom de la catégorie est bien saisie dans toutes les langues ! ");</script><?php
      }
      unset($_POST['AddBtn']);
    }

?>
    <form method="post">
      <div class="wrap">

      <h1 class="wow fadeIn">Ajout d'une nouvelle catégorie</h1>
        <section class="catalogue_products wow fadeInUp">
            <div class="catalogue_products_wrap back">
          <?php

            foreach ($lstLanguages as $language) {?>
                    <article class="article_products_display">
                        <div class="article_products_display_details">
                            <h3><?php echo $language['name'];?></h3>
                            <p class="article_products_display_details_title">Nom catégorie :</p>
                            <input name="categName<?php echo $language['id_language'];?>" class="back_input_name" type="text" value="">
                            <p class="article_products_display_details_title">Description :</p>
                            <textarea name="categDesc<?php echo $language['id_language'];?>"></textarea>
                        </div>
                    </article>
                    <hr>
            <?php } ?>
              <button name="AddBtn">Ajouter</button>
            </div>
        </section>
      </div>
    </form>

<?php require_once '../../footer.php'; ?>
