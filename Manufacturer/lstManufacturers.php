<?php   include '../Class/Functions.php'; ?>
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Fabricants</title>
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    <?php
    $content = "";
    $content .= "<ul>";
     $content .= "<li><a href='http://192.168.33.10'>Articles</a></li>";
     $content .= "<li><a href='#'>Fabricants</a></li>";
    $content .= "</ul><br>";

  $content .= "<br><h3>List of manufacturer</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Nom du produit</td>";
    $content .=  "<th></th>";
  $content .=  "</tr>";

  $lstFunctions = new Functions();

  foreach ($lstFunctions->getManufacturers() as $manufacturer) {
    $content .= "<tr>";
      $content .= "<td><a href=deleteManufacturer.php?manufacturer=".$manufacturer['id_manufacturer'].">-</a></td>";
      $content .= "<td>". $manufacturer['name']."</td>";
      $content .= "<td><a href=updateProduct.php?product=".$manufacturer['id_manufacturer'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
  $content .= "<a href=addManufacturer.php>Ajouter fabricant</a>";
  
  echo $content;
  ?>


  </body>
</html>
