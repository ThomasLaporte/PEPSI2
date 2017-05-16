<?php
    include "../../Class/Functions.php";
    $title_page = 'Spectasonic - Catalogue Backoffice';
    require_once "../../header.php";

    $content = "<br><h3>Liste des produits</h3>";
    $content .=  "<table>";

    $content .=  "<tr>";
      $content .=  "<th></th>";
      $content .=  "<th>Nom produit</td>";
      $content .=  "<th></th>";
    $content .=  "</tr>";

    $lstFunctions = new Functions();

    foreach ($lstFunctions->getProducts() as $product) {
      $content .= "<tr>";
        $content .= "<td><a href=../Article/deleteProduct.php?product=".$product['id_article']."> X </a></td>";
        $content .= "<td>". $product['name']."</td>";
        $content .= "<td><a href=../Article/updateProduct.php?product=".$product['id_article'].">Modifier</a></td>";
      $content .= "</tr>";
    }

    $content .=  "</table>";
    $content .= "<a href=addProduct.php><input type=\"submit\" class=\"upload-submit\" value=\"Ajouter produit\"></a>";

    echo $content;
  ?>


  </body>
</html>
