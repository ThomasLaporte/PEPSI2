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
     $sql = "INSERT INTO Manufacturer (name, adress, postal_code, city, country) ".
            "VALUES (:name,:adress,:postalCode,:city,:country)";

    $array = array(
      ':name' => $name,
      ':adress' => $adress,
      ':postalCode' => $postal,
      ':city' => $city,
      ':country' => $country);

    $this->DB->query($sql, $array);
    return true;

   }


}
