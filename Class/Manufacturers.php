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
      return $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function addManufacturer($name, $adress, $postal, $city, $country)
   {
       $sql = "INSERT INTO manufacturer (name, adress, postal_code, city, country) ".
              "VALUES (:name, :adress, :postalCode, :city, :country)";

      $array = array(
        ':name' => $name,
        ':adress' => $adress,
        ':postalCode' => $postal,
        ':city' => $city,
        ':country' => $country);

      return $this->DB->query($sql, $array);
   }

   public function deleteManufacturer($id)
   {
     $sql = "DELETE FROM manufacturer WHERE id_manufacturer= :id LIMIT 1";

     $array = array(
       ':id' => $id);

      return $this->DB->query($sql, $array);
   }

   public function getManufacturerById($id)
   {
     $sql = "SELECT * FROM manufacturer WHERE id_manufacturer ='".$id ."' LIMIT 1";
     $sth = $this->DB->query($sql);
     return $sth->fetch(PDO::FETCH_ASSOC);
   }

   public function updateManufacturer($id, $name, $adress, $postalCode, $city, $country)
   {
     $sql = "UPDATE manufacturer SET name = :name, adress = :adress, postal_code = :postal, city = :city, country = :country ".
            "WHERE id_manufacturer = :id LIMIT 1";

    $array = array(
      ':id' => $id,
      ':name' => $name,
      ':adress' => $adress,
      ':postal' => $postalCode,
      ':city' => $city,
      ':country' => $country);

    return $this->DB->query($sql, $array);
   }


   public function getCountryById($id)
   {
     $sql = "SELECT * FROM pays WHERE id = :idPays";
     $array = array(
       ':idPays' => $id);

     $sth = $this->DB->query($sql, $array);
     return $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function getCountries()
   {
     $sql = "SELECT * FROM pays";
     $sth = $this->DB->query($sql);
     return $sth->fetchAll(PDO::FETCH_ASSOC);
   }
}
