<?php
  include 'Class/Functions.php';
  require_once 'header.php';


  $content = "";
  $lstFunctions = new Functions();

  $content .= "<br><h3>List of article catgories</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Category name</th>";
    $content .=  "<th></th>";
  $content .=  "</tr>";


  // Le parametre correspond a la langue : par defaut Francais (id 1)
  foreach ($lstFunctions->getProductsCategsByLang(1) as $categ) {
    $content .= "<tr>";
      $content .= "<td><a href=deleteProductCateg.php?categ=".$categ['id_article_category'].">-</a></td>";
      $content .= "<td>". $categ['name']."</td>";
      $content .= "<td><a href=updateProductCateg.php?categ=".$categ['id_article_category'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
  $content .= "<a href=addProduct.php>Ajouter produit</a>";



  echo $content;
  ?>


</body>
</html>
