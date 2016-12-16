<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Index</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  <?php
  include 'treatment.php';

  echo "<h3>List of products</h3>";
  echo "<table>";

  echo "<tr>"
    echo "<th>Nom du produit</td>";
    echo "<th></th>";
  echo "</tr>";
  foreach (echo getProducts() as $product) {
    echo "<tr>"
      echo "<td>".$product['nom']."</td>";
      echo "<td><a href=modifProduct.php?product='".$product['id']."'>Modifier</a></td>";
    echo "</tr>";
  }
  echo "</table>";

  ?>


  </body>
</html>
