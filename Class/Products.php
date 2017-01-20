<?php

class Products {
  private $DB;

 function __construct($DB) {
   $this->DB = $DB;
 }

 public function listProducts()
 {
    $sql = "SELECT * FROM product";
    $sth = $this->DB->query($sql);
    $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
    return $rowset;
 }

 public function productByID($id)
 {
    $sql = "SELECT * FROM product WHERE id ='".$id ."'";
    $sth = $this->DB->query($sql);
    $rowset = $sth->fetch(PDO::FETCH_ASSOC);
    return $rowset;

 }

 public function updateProduct($id, $name, $price)
 {
   $sql = "UPDATE Product ".
          "SET nom_colonne_1 = 'nouvelle valeur',
          colonne2 = 'TEST'".
          "WHERE id = '".$id."'";
   $sth = $this->DB->query($sql);
   return true;

 }

 public function deleteProduct($id)
 {
   $sql = "DELETE FROM Product WHERE id='".$id."'";
   $sth = $this->DB->query($sql);
   return true;

 }


}
