<?php
  include "../../Class/Functions.php";
  $title_page = 'Spectasonic - Catalogue Backoffice';
  require_once "../../header.php";

  $lstFunctions = new Functions();

  // Ajout du client
  if(isset($_POST['addBtn']))
  {
      $customerId= $lstFunctions->addCustomer($_POST['customerLogin'], sha1($_POST['customerPassword']), $_POST['customerCompanyName'],$_POST['customerName'],$_POST['customerEmail'],
                                 $_POST['customerPhone'], $_POST['customerMobile'], $_POST['customerFax'], $_POST['customerFunction'], (isset($_POST['customerAdmin']))? 1 : 0);

      foreach ($lstFunctions->getAdressTypes() as $adressType) {
        $lstFunctions->addCustomerAdress($customerId, $_POST['customerAdress'.$adressType['id_type_address']], $_POST['customerPostal'.$adressType['id_type_address']], $_POST['customerCity'.$adressType['id_type_address']], $_POST['customerCountry'.$adressType['id_type_address']], $adressType['id_type_address']);

      }
      unset($_POST['addBtn']);
  }
?>

<form method="post">
  <div class="wrap">

  <h1 class="wow fadeIn">Ajout d'un client</h1>
    <section class="catalogue_products wow fadeInUp">
        <div class="catalogue_products_wrap back">
              <article class="article_products_display">
                  <div class="article_products_display_details">
                    <p class="article_products_display_details_title">Identifiant :</p>
                    <input name="customerLogin" class="back_input_name" required type="text" value="">
                    <p class="article_products_display_details_title">Mot de passe :</p>
                    <input name="customerPassword" class="back_input_name" required type="password" value="">
                    <p class="article_products_display_details_title">Nom du responsable :</p>
                    <input name="customerName" class="back_input_name" required type="text" value="">
                    <p class="article_products_display_details_title">Raison sociale :</p>
                    <input name="customerCompanyName" class="back_input_name" required type="text" value="">
                    <p class="article_products_display_details_title">Email :</p>
                    <input name="customerEmail" class="back_input_name" type="email" value="">
                    <p class="article_products_display_details_title">Téléphone :</p>
                    <input name="customerPhone" class="back_input_name" required type="tel" value="">
                    <p class="article_products_display_details_title">Portable :</p>
                    <input name="customerMobile" class="back_input_name" type="tel" value="">
                    <p class="article_products_display_details_title">Fax :</p>
                    <input name="customerFax" class="back_input_name" type="tel" value="">
                    <p class="article_products_display_details_title">Fonction :</p>
                    <input name="customerFunction" class="back_input_name" type="text" value="">

                    <p class="article_products_display_details_title">Administrateur :</p>
                    <input type="checkbox" name="customerAdmin"><br><?php

                    foreach ($lstFunctions->getAdressTypes() as $adressType) {?>
                      <hr>
                      <h3>Type : <?php echo $adressType["name"];?></h3>
                      <p class="article_products_display_details_title">Adresse :</p>
                      <input name="customerAdress<?php echo $adressType['id_type_address']; ?>" class="back_input_name" type="text" value="">
                      <p class="article_products_display_details_title">Code postal :</p>
                      <input name="customerPostal<?php echo $adressType['id_type_address']; ?>" pattern="[0-9]{5}" class="back_input_name" type="text" value="">
                      <p class="article_products_display_details_title">Ville :</p>
                      <input name="customerCity<?php echo $adressType['id_type_address']; ?>" class="back_input_name" type="text" value="">
                      <p class="article_products_display_details_title">Pays :</p>
                      <select name="customerCountry<?php echo $adressType['id_type_address']; ?>">
                      <?php foreach ($lstFunctions->getCountries() as $country) {?>
                              <option value="<?php echo $country['id'];?>"><?php echo $country['nom_fr_fr']; ?></option>
                      <?php } ?>
                      </select><?php
                    } ?>
                  </div>
              </article>
          <button name="addBtn">Ajouter</button>
        </div>
    </section>
  </div>
</form>


<?php
  include '../../footer.php';
