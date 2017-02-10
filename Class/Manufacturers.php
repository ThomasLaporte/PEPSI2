<?php

class Manufacturers {
   private $DB;

   function __construct($DB) {
     $this->DB = $DB;
   }

   public function listManufacturers()
   {
      $sql = "SELECT * FROM manufacturer";
      $sth = $this->DB->query($sql);
      $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
      return $rowset;
   }

   public function addManufacturer($name, $adress, $postal, $city, $country)
   {
     try {

       $sql = "INSERT INTO manufacturer (name, adress, postal_code, city, country) ".
              "VALUES (:name,:adress,:postalCode,:city,:country)";

      $array = array(
        ':name' => $name,
        ':adress' => $adress,
        ':postalCode' => $postal,
        ':city' => $city,
        ':country' => $country);

      $this->DB->query($sql, $array);
      return true;
    } catch (Exception $e) {
        echo "Une erreur a été rencontrée lors de l'ajout dans la base de donnée." . $e;
    }
   }

   public function deleteManufacturer($id)
   {
     $sql = "DELETE FROM manufacturer WHERE id_manufacturer= :id LIMIT 1";

     $array = array(
       ':id' => $id);

      $this->DB->query($sql, $array);
      return true;
   }


}
