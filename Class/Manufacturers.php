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
              "VALUES (:name, :adress, :postalCode, :city, :country)";

      $array = array(
        ':name' => $name,
        ':adress' => $adress,
        ':postalCode' => $postal,
        ':city' => $city,
        ':country' => $country);

      return $this->DB->query($sql, $array);

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

   public function getManufacturerById($id)
   {
     $sql = "SELECT * FROM manufacturer WHERE id_manufacturer ='".$id ."' LIMIT 1";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetch(PDO::FETCH_ASSOC);
     return $rowset;

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
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }

   public function getCountries()
   {
     $sql = "SELECT * FROM pays";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }


}
