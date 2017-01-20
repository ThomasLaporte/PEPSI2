<?php   include 'Class/Functions.php'; ?>
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Index</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  <?php
  $content = "";

  $content .= "<h3>List of products</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Nom du produit</td>";
    $content .=  "<th></th>";
  $content .=  "</tr>";

  $lstFunctions = new Functions();

  foreach ($lstFunctions->getProducts() as $product) {
    $content .= "<tr>";
      $content .= "<td><a href=deleteProduct.php?product=".$product['id'].">-</a></td>";
      $content .= "<td>". $product['name']. $product['id']."</td>";
      $content .= "<td><a href=modifProduct.php?product=".$product['id'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
$content .= "<a href=modifProduct.php?product='".  $product['id']."'>Ajouter produit</a>";



echo $content;
  ?>


  </body>
</html>
