<?php include "Class/Functions.php"; ?>
<!doctype html>
<!-- <html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Index</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body> -->
    <?php
    require_once "header.php";
    $content = "";
    // $content .= "<ul>";
    //  $content .= "<li><a href='#'>Articles</a></li>";
    //  $content .= "<li><a href='Manufacturer/lstManufacturers.php'>Fabricants</a></li>";
    // $content .= "</ul><br>";

  $content .= "<br><h3>List of products</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Nom du produit</td>";
    $content .=  "<th></th>";
  $content .=  "</tr>";

  $lstFunctions = new Functions();

  foreach ($lstFunctions->getProducts() as $product) {
    $content .= "<tr>";
      $content .= "<td><a href=deleteProduct.php?product=".$product['id_article'].">-</a></td>";
      $content .= "<td>". $product['name']."</td>";
      $content .= "<td><a href=updateProduct.php?product=".$product['id_article'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
$content .= "<a href=addProduct.php>Ajouter produit</a>";



echo $content;
  ?>


  </body>
</html>
