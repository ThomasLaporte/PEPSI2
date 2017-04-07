
<?php include "../../Class/Functions.php";

    require_once "../../header.php";
    $lstFunctions = new Functions();
    $currentCateg = $lstFunctions->getProductCategByID($_GET['categ']);

    // Si le id passé dans $_GET est valide
    if(isset($_GET['categ']) && !empty($currentCateg)){

      if(isset($_POST['submit']) && $_POST['submit'])
      {

        // Parcours des champs pour enregistrer les modifications
        foreach ($currentCateg as $categ) {
          // if(isset($_POST["categName". $categ['code']]) && strlen($_POST["categName". $categ['code']]) > 0)
          // {

            $test = $lstFunctions->updateProductCateg($_GET['categ'], $_POST["categName". $categ['language_idlanguage']], $categ['language_idlanguage'], $_POST["categDesc". $categ['language_idlanguage']]);
        //  }


        }
        ?> <script>alert("Mise(s) à jour terminée(s) ! ");
        //window.location.reload();</script> <?php
        header("Location: lstArticleCateg.php");

      }

      $content = "<br><h2>Modification de la catégorie</h2>";
      $content .= "<form method=\"post\">";

      foreach ($currentCateg as $categ) {

        $currentLanguage = $lstFunctions->getLanguageByIdBis($categ['language_idlanguage']);
        $content .= $currentLanguage['name'] ." name: <input type=\"text\" name=\"categName". $categ['language_idlanguage']."\" value=\"". $categ['name']."\"><br>";
        $content .= "Description:<textarea rows=\"6\" cols=\"50\" name=\"categDesc". $categ['language_idlanguage']."\">".$categ['description']."</textarea><br><br>";
      }
      $content .="<input type=\"submit\" name=\"submit\" value=\"Valider\">";
      $content .="</form>";
      echo $content;
    }
  else {
    header("Location: lstArticleCateg.php");
  } ?>
  </body>
</html>
