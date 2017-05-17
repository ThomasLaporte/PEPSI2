<?php
$title_page = 'Spectasonic - Catalogue Backoffice';
require_once "../../header.php";
include "../../Class/Functions.php";
$lstFunctions = new Functions();

  $content = "<br><h3>Liste des catégories</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th></th>";
    $content .=  "<th>Nom catégorie</th>";
    $content .=  "<th></th>";
  $content .=  "</tr>";


  // Le parametre correspond a la langue : par defaut Francais (id 1)
  foreach ($lstFunctions->getProductsCategsByLang('1') as $categ) {
    $content .= "<tr>";
      $content .= "<td><a href=\"deleteCategArticle.php?categ=".$categ['code']."\"> X </a></td>";
      $content .= "<td>". $categ['name']."</td>";
      $content .= "<td><a href=updateProductCateg.php?categ=".$categ['code'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
  $content .= "<a href=addCategArticle.php><input type=\"submit\" class=\"upload-submit\" value=\"Ajouter catégorie\"></a>";

  echo $content;
  ?>


</body>
</html>
