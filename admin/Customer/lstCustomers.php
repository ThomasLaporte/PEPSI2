<?php
  include "../../Class/Functions.php";
  $title_page = 'Spectasonic - Catalogue Backoffice';
  require_once "../../header.php";

  $lstFunctions = new Functions();?>

  <h3>Liste des clients</h3>
  <a href=addCustomer.php><input type="submit" class="upload-submit" value="Ajouter produit"></a>
  <table>
    <tr>
      <th></th>
      <th>Nom client</th>
    </tr><?php

   foreach ($lstFunctions->getCustomers() as $customer) {?>
     <tr>
        <td><a href="deleteCustomer.php?customer=<?php echo $customer['id_customer'];?>"> X </a></td>
        <td><?php echo $customer['customer_name'];?></td>
        <td><a href="updateCustomer.php?customer=<?php echo $customer['id_customer'];?>">Modifier utilisateur</a></td>
        <td><a href="customerReductions.php?customer=<?php echo $customer['id_customer'];?>">Réductions</a></td>
     </tr><?php
   }?>
  </table>

  <?php include '../../footer.php';
