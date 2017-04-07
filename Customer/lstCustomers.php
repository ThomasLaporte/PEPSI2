<?php
  include "../Class/Functions.php";
   include '../header.php';

  $content = "<br><h3>Liste des clients</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th></th>";
    $content .=  "<th>Nom client</th>";
  $content .=  "</tr>";

  $lstFunctions = new Functions();

  foreach ($lstFunctions->getCustomers() as $customer) {
    $content .= "<tr>";
      $content .= "<td><a href=deleteCustomer.php?customer=".$customer['id_customer'].">-</a></td>";
      $content .= "<td>". $customer['customer_name']."</td>";
      $content .= "<td><a href=updateCustomer.php?customer=".$customer['id_customer'].">Modifier utilisateur</a></td>";
      $content .= "<td><a href=customerReductions.php?customer=".$customer['id_customer'].">Réductions</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
  $content .= "<a href=../Article/addProduct.php>Ajouter produit</a>";

  echo $content;
?>


  </body>
</html>
