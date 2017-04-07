<?php include "../Class/Functions.php";
    require_once "../header.html";

  $content = "<br><h3>List of manufacturer</h3>";
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
      $content .= "<td><a href=updateManufacturer.php?manufacturer=".$manufacturer['id_manufacturer'].">Modifier</a></td>";
    $content .= "</tr>";
  }

  $content .=  "</table>";
  $content .= "<a href=addManufacturer.php>Ajouter fabricant</a>";

  echo $content;
  ?>


  </body>
</html>
