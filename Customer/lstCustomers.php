<?php include "../Class/Functions.php";

    require_once "../header.html";
    $content = "";


  $content .= "<br><h3>List of customers</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Customers name</td>";
    $content .=  "<th></th>";
  $content .=  "</tr>";

  $lstFunctions = new Functions();

  foreach ($lstFunctions->getCustomers() as $customer) {
    $content .= "<tr>";
      //$content .= "<td><a href=../Article/deleteProduct.php?product=".$product['id_article'].">-</a></td>";
      $content .= "<td>". $customer['customer_name']."</td>";
      //$content .= "<td><a href=../Article/updateProduct.php?product=".$product['id_article'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
$content .= "<a href=../Article/addProduct.php>Ajouter produit</a>";



echo $content;
  ?>


  </body>
</html>
