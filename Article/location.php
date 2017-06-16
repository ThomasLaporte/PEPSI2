<?php
include "../Class/Functions.php";
if (isset($_POST['type'])) {

      switch ($_POST['type']) {

          case 'detail':

          $lstFunctions = new Functions();
          $tabPosition = Array();
          foreach ($lstFunctions->getCustomerMap() as $product) {

            $name=utf8_encode($product['customer_name']).' '.utf8_encode($product['adress']).' '.utf8_encode($product['postal_code']).' '.utf8_encode($product['city']);

            array_push($tabPosition,array($name,utf8_encode($product['latitude']),utf8_encode($product['longitude'])));

          }
          //var_dump($tabPosition);
          echo json_encode($tabPosition);
          //var_dump(json_last_error_msg());
          break;
      }
}

?>
