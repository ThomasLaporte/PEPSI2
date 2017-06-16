<?php   include '../../Class/Functions.php';

    if(isset($_GET['categ'])){
      $lstFunctions = new Functions();
      $articlesCateg = $lstFunctions->getProductByCateg($_GET['categ']);
      if(count($articlesCateg) > 0)
      {
          ?> <script>alert(count($articlesCateg) ." article(s) contiennent cet catégorie, veuillez la modifier dans chacune d'elles avant de faire une suppression de catgéorie");
                      document.location.href = 'lstArticleCateg.php';</script> <?php
      }
      else {
        $lstFunctions->deleteProductCateg($_GET['categ']);
        header("Location: lstArticleCateg.php");
      }

      //echo $lstFunctions->deleteProductCateg($_GET['categ']);
      // $lstFunctions->deleteProductCateg($_GET['categ']);

    }
