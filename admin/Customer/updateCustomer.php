<?php
    include "../../Class/Functions.php";
    $title_page = 'Spectasonic - Catalogue Backoffice';
    require_once "../../header.php";

    $lstFunctions = new Functions();
    if(isset($_GET['customer']))
    {
      // Si l'utilisateur clic sur le bouton de mise à jour
      if(isset($_POST['updateBtn'])){
        $updateDown = $lstFunctions->updateCustomer($_GET['customer'], $_POST['customerCompanyName'], $_POST['customerName'], $_POST['customerEmail'], $_POST['customerPhone'], $_POST['customerMobile'], $_POST['customerFax'],$_POST['customerFunction'], (isset($_POST['customerAdmin']))? 1 : 0);

        // Mise à jour des adresses (facturation/livraison)
        foreach ($lstFunctions->getAdressesCustomer($_GET['customer']) as $adress)
        {
          $updateDown += $lstFunctions->updateAdressCustomer($adress['id_adress'], $_POST['customerAdr_Adress'.$adress['id_adress']], $_POST['customerAdr_Postal'.$adress['id_adress']], $_POST['customerAdr_City'.$adress['id_adress']], $_POST['customerAdr_Country'.$adress['id_adress']]);
        }

        // Si au moins une msie à jour a été effectuée, on retourne à la liste des clients
        if($updateDown > 0)
        {
          header("Location: lstCustomers.php");
        }
      }

      $currentCustomer = $lstFunctions->getCustomerById($_GET['customer'])[0]; ?>
      <form method="post">
        <div class="wrap">

        <h1 class="wow fadeIn">Mise à jour utilisateur</h1>
          <section class="catalogue_products wow fadeInUp">
              <div class="catalogue_products_wrap back">
                  <article class="article_products_display">
                      <div class="article_products_display_details">
                          <p class="article_products_display_details_title">Nom du responsable :</p>
                          <input name="customerName" class="back_input_name" required type="text" value="<?php echo $currentCustomer['name'];?>">
                          <p class="article_products_display_details_title">Raison sociale :</p>
                          <input name="customerCompanyName" class="back_input_name" required type="text" value="<?php echo $currentCustomer['customer_name'];?>">
                          <p class="article_products_display_details_title">Email :</p>
                          <input name="customerEmail" class="back_input_name" type="text" value="<?php echo $currentCustomer['email'];?>">
                          <p class="article_products_display_details_title">Téléphone :</p>
                          <input name="customerPhone" class="back_input_name" required type="text" value="<?php echo ((strlen($currentCustomer['phone']) > 1)? str_pad($currentCustomer['phone'],10,"0",STR_PAD_LEFT) : "");?>">
                          <p class="article_products_display_details_title">Portable :</p>
                          <input name="customerMobile" class="back_input_name" type="text" value="<?php echo ((strlen($currentCustomer['mobile']) > 1)? str_pad($currentCustomer['mobile'],10,"0",STR_PAD_LEFT) : "");?>">
                          <p class="article_products_display_details_title">Fax :</p>
                          <input name="customerFax" class="back_input_name" type="text" value="<?php echo ((strlen($currentCustomer['fax']) > 1)? str_pad($currentCustomer['fax'],10,"0",STR_PAD_LEFT) : "");?>">
                          <p class="article_products_display_details_title">Fonction :</p>
                          <input name="customerFunction" class="back_input_name" type="text" value="<?php echo $currentCustomer['function'];?>">

                          <p class="article_products_display_details_title">Administrateur :</p>
                          <input type="checkbox" name="customerAdmin" <?php echo (($currentCustomer['admin'] == 1)? "checked" : ""); ?>><br>

                            <?php foreach ($lstFunctions->getAdressesCustomer($_GET['customer']) as $adress) { ?>
                                    <hr>
                                    <h3>Type : <?php echo $adress["adressType"];?></h3>
                                    <p class="article_products_display_details_title">Adresse :</p>
                                    <input name="customerAdr_Adress<?php echo $adress['id_adress']; ?>" class="back_input_name" type="text" value="<?php echo $adress['adress'];?>">
                                    <p class="article_products_display_details_title">Code postal :</p>
                                    <input name="customerAdr_Postal<?php echo $adress['id_adress']; ?>" class="back_input_name" type="text" value="<?php echo str_pad($adress['postal_code'],5,"0",STR_PAD_LEFT);?>">
                                    <p class="article_products_display_details_title">Ville :</p>
                                    <input name="customerAdr_City<?php echo $adress['id_adress']; ?>" class="back_input_name" type="text" value="<?php echo $adress['city'];?>">
                                    <p class="article_products_display_details_title">Pays :</p>
                                    <select name="customerAdr_Country<?php echo $adress['id_adress']; ?>">
                                    <?php foreach ($lstFunctions->getCountries() as $country) { ?>
                                            <option value="<?php echo $country['id'];?>" <?php echo (($country['id'] == $adress['country'])? "Selected" : ""); ?>><?php echo $country['nom_fr_fr']; ?></option>
                                    <?php } ?>
                                    </select></br>
                          <?php }?>
                      </div>
                  </article>
                <button name="updateBtn">Modifier</button>
              </div>
          </section>
        </div>
      </form>
      <?php
    }
    else {
      header('Location : lstCustomers.php');
    }
  include '../../footer.php';
