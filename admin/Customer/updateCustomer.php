<?php
    include "../../Class/Functions.php";
    require_once "../../header.php";

    $lstFunctions = new Functions();
    if(isset($_GET['customer']))
    {
      if(isset($_POST['buttonClic'])){
        $updateDown = 0;

        // On fait un test pour savoir si l'utilisateur a check la case administrateur
        $isAdmin = 0;
        if(isset($_POST['customerAdmin'])){$isAdmin = 1;}

        $updateDown += $lstFunctions->updateCustomer($_GET['customer'], $_POST['customerCompanyName'], $_POST['customerName'], $_POST['customerEmail'], $_POST['customerPhone'], $_POST['customerMobile'], $_POST['customerFax'],$_POST['customerFunction'], $isAdmin);

        // Update de ses adresses (facturation/livraison)
        foreach ($lstFunctions->getAdressesCustomer($_GET['customer']) as $adress)
        {
          $updateDown += $lstFunctions->updateAdressCustomer($adress['id_adress'], $_POST['customerAdr_Adress'.$adress['id_adress']], $_POST['customerAdr_Postal'.$adress['id_adress']], $_POST['customerAdr_City'.$adress['id_adress']], $_POST['customerAdr_Country'.$adress['id_adress']]);
        }

        // Si au moins une msie à jour a été effectuée, on retourne à la liste des clients
        // if($updateDown > 0)
        // {
        //   header("Location: lstCustomers.php");
        // }
      }


      $currentCustomer = $lstFunctions->getCustomerById($_GET['customer'])[0];

      $content = "<h3>Modification de la fiche client</h3>";
      $content .= "<form method=\"post\">";
      $content .= "Nom responsable:<input type=\"text\" required name=\"customerName\" value=\"".$currentCustomer['name']."\"><br>";
      $content .= "Raison sociale: <input type=\"text\" required name=\"customerCompanyName\" value=\"".$currentCustomer['customer_name']."\"><br>";
      $content .= "Email:<input type=\"text\" required name=\"customerEmail\" value=\"".$currentCustomer['email']."\"><br>";
      $content .= "Téléphone fixe:<input type=\"text\" required name=\"customerPhone\" value=\"".str_pad($currentCustomer['phone'],10,"0",STR_PAD_LEFT)."\"><br>";
      $content .= "Portable: <input type=\"text\" required name=\"customerMobile\" value=\"".str_pad($currentCustomer['mobile'],10,"0",STR_PAD_LEFT)."\"><br>";
      $content .= "Fax:<input type=\"text\" name=\"customerFax\" value=\"".str_pad($currentCustomer['fax'],10,"0",STR_PAD_LEFT)."\"><br>";
      $content .= "Fonction:<input type=\"text\" name=\"customerFunction\" value=\"".$currentCustomer['function']."\"><br>";

      $isAdmin = "";
      if($currentCustomer['admin'] == 1){$isAdmin = "checked";}
      $content .= "Adminitrateur:<input type=\"checkbox\" name=\"customerAdmin\"". $isAdmin."><br>";

      // Zone des adresses du customer
      $content .=  "<table>";
      $content .= "</br>";
      foreach ($lstFunctions->getAdressesCustomer($_GET['customer']) as $adress) {
        $content .= "<hr>";
        $content .= "<h4>Type : ".$adress["adressType"]."</h4>";
        $content .= "Adresse: <input type=\"text\" required name=\"customerAdr_Adress".$adress['id_adress']."\" value=\"".$adress['adress']."\"><br>";
        $content .= "Code postal: <input type=\"number\" required name=\"customerAdr_Postal".$adress['id_adress']."\" value=\"".str_pad($adress['postal_code'],5,"0",STR_PAD_LEFT)."\"><br>";
        $content .= "Ville: <input type=\"text\" required name=\"customerAdr_City".$adress['id_adress']."\" value=\"".$adress['city']."\"><br>";
        $content .= "Pays: <select name=\"customerAdr_Country".$adress['id_adress']."\">";
        foreach ($lstFunctions->getCountries() as $country) {
          $isSelected = "";
          if($country['id'] == $adress['country']){$isSelected = "Selected";}
          $content .= "<option value=\"".$country['id']."\" ".$isSelected.">".$country['nom_fr_fr']."</option>";
        }
        $content .= "</select></br>";

      }
      $content .=  "</table><br>";

      $content .="<input type=\"submit\" name=\"buttonClic\" value=\"Valider\">";
      $content .="</form>";
      echo $content;

    }
    else {
      header('Location : lstCustomers.php');
    }
