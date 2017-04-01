<?php include "../Class/Functions.php";

    require_once "../header.html";
    $content = "";


  $content .= "<br><h3>List of products</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Product Name</td>";
    $content .=  "<th></th>";
  $content .=  "</tr>";

  $lstFunctions = new Functions();

  foreach ($lstFunctions->getProducts() as $product) {
    $content .= "<tr>";
      $content .= "<td><a href=../Article/deleteProduct.php?product=".$product['id_article'].">-</a></td>";
      $content .= "<td>". $product['name']."</td>";
      $content .= "<td><a href=../Article/updateProduct.php?product=".$product['id_article'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
$content .= "<a href=../Article/addProduct.php>Ajouter produit</a>";



echo $content;
  ?>


  </body>
</html>
