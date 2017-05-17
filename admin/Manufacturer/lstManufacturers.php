<?php
  include "../../Class/Functions.php";
  $title_page = 'Spectasonic - Catalogue Backoffice';
  require_once "../../header.php";

  $lstFunctions = new Functions();?>

  <h1>Liste des fournisseurs</h1>
  <table>
    <tr>
      <th></th>
      <th>Nom du produit</th>
    </tr>

  <?php
  foreach ($lstFunctions->getManufacturers() as $manufacturer) {?>
    <tr>
      <td><a href="deleteManufacturer.php?manufacturer=<?php echo $manufacturer['id_manufacturer'];?>"> X </a></td>
      <td><?php echo $manufacturer['name'];?></td>
      <td><a href="updateManufacturer.php?manufacturer=<?php echo $manufacturer['id_manufacturer'];?>">Modifier</a></td>
    </tr><?php
  }?>

  </table>
  <a href=addManufacturer.php><input type="submit" class="upload-submit" value="Ajouter fournisseur"></a>

<?php
    include '../../footer.php';
  ?>
