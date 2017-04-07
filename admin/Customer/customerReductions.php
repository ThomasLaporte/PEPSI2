<?php include "../../Class/Functions.php";

    require_once "../../header.php";

    $lstFunctions = new Functions();
    if(isset($_GET['customer']))
    {
      if(isset($_POST['priceValue']) && strlen($_POST['priceValue']) > 0)
      {
        // Ajout d'une nouvelle réduction pour l'utilisateur
        if($_POST['reductionType'] == 'pourcent'){
          $lstFunctions->addPriceCustomer($_POST['productsAvailable'], $_GET['customer'], 0, $_POST['priceValue']);
        }
        else {
          $lstFunctions->addPriceCustomer($_POST['productsAvailable'], $_GET['customer'], $_POST['priceValue'], 0);
        }

      }


    $content = "";

    $content .= "<br><h3>Liste des réductions du client</h3>";
    $content .=  "<table>";

    $content .=  "<tr>";
      $content .=  "<th>Nom de l'article</td>";
      $content .=  "<th>Valeur de la réduction</td>";
    $content .=  "</tr>";

    $lstPricesUser = $lstFunctions->getPricesByCustomerId($_GET['customer']);

    foreach ($lstPricesUser as $price) {
      $content .= "<tr>";
        $product = $lstFunctions->getProductByID($price['article_id_article']);

        $content .= "<td>". $product['name']."</td>";

        $value = "";
        if($price['fixe'] > 0){$value = $price['fixe']."€";} else { $value = $price['pourcentage']."%"; }

        $content .= "<td>". $value."</td>";

      $content .= "</tr>";
    }
    $content .=  "</table>";


    $content .= "<br><h3>Ajout d'une nouvelle réduction</h3>";
    $content .= "<form method=\"post\">";
    $content .=  "<br><table>";

    $content .=  "<tr>";
      $content .=  "<th>Produit</th>";
      $content .=  "<th>Type réduction</th>";
      $content .=  "<th>Valeur</th>";
    $content .=  "</tr>";
    $content .=  "<tr>";
    $content .= "<td><select name=\"productsAvailable\" id=\"productsAvailable\">";

    foreach ($lstFunctions->getProducts() as $product) {
      if (!in_array($product['id_article'], array_column($lstPricesUser ,'article_id_article'))){
        $content .= "<option value=\"".$product['id_article']."\">".$product['name']."</option>";
      }
    }
    $content .= "</select></td>";

    $content .= "<td><select name=\"reductionType\" id=\"reductionType\">";
        $content .= "<option name=\"fixe\" value=\"fixe\">Fixe</option>";
        $content .= "<option name=\"pourcent\" value=\"pourcent\">Pourcentage</option>";
    $content .= "</select></td>";

    $content .= "<td><input type=\"number\" name=\"priceValue\"></td>";

    $content .="<td><input type=\"submit\" name=\"submit\" value=\"Ajouter\"></td>";
    $content .=  "</tr></table>";

    $content .="</form>";

    echo $content;
    }
    else {
      header('Location : lstCustomers.php');
    }
    ?>
    </body>
  </html>
