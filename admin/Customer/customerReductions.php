<?php include "../../Class/Functions.php";
    $title_page = 'Spectasonic - Catalogue Backoffice';
    require_once "../../header.php";

    $lstFunctions = new Functions();
    if(isset($_GET['customer']))
    {
      if(isset($_POST['priceValue']) && strlen($_POST['priceValue']) > 0 && isset($_POST['submit']))
      {
        // Ajout d'une nouvelle réduction pour l'utilisateur
        if($_POST['reductionType'] == 'pourcent'){
          $lstFunctions->addPriceCustomer($_POST['productsAvailable'], $_GET['customer'], 0, $_POST['priceValue']);
        }
        else {
          $lstFunctions->addPriceCustomer($_POST['productsAvailable'], $_GET['customer'], $_POST['priceValue'], 0);
        }
        unset($_POST['submit']);
      }
      $lstPricesUser = $lstFunctions->getPricesByCustomerId($_GET['customer']);
  ?>

    <h1>Liste des réductions du client</h1>
    <table>
      <tr>
        <th></td>
        <th>Nom de l'article</td>
        <th>Valeur de la réduction</td>
      </tr>

      <?php foreach ($lstPricesUser as $price) {
              $product = $lstFunctions->getProductByID($price['article_id_article']);?>
              <tr>
                <td><a href="deleteReduction.php?customer=<?php echo $_GET['customer'] ?>&article=<?php echo $price['article_id_article'] ?>"> X </a></td>
                <td><?php echo $product['name'];?></td>
                <td><?php echo (($price['fixe'] > 0)? $price['fixe']."€" : $price['pourcentage']."%");?></td>
              </tr>
      <?php } ?>
     </table>

     <h1>Ajout d'une nouvelle réduction</h1>
     <form method="post">
       <table>
         <tr>
           <th>Produit</th>
           <th>Type réduction</th>
           <th>Valeur</th>
         </tr>
         <tr>
            <td><select name="productsAvailable" id="productsAvailable">

          <?php foreach ($lstFunctions->getProducts() as $product) {
                  if (!in_array($product['id_article'], array_column($lstPricesUser ,'article_id_article'))){ ?>
                      <option value="<?php echo $product['id_article'];?>"><?php echo $product['name'];?></option><?php
                  }
                } ?>
            </select></td>
            <td><select name="reductionType" id="reductionType">
                  <option name="fixe" value="Pourcentage">Fixe</option>";
                  <option name="pourcent" value="Pourcentage">Pourcentage</option>
            </select></td>
            <td><input type="number" name="priceValue"></td>
            <td><input type="submit" name="submit" value="Ajouter"></td>
          </tr>
        </table>
     </form><?php
    }
    else {
      header('Location : lstCustomers.php');
    }
  include '../../footer.php';
