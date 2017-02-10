<?php

class Products {
  private $DB;

 function __construct($DB) {
   $this->DB = $DB;
 }

 public function listProducts()
 {
    $sql = "SELECT * FROM article";
    $sth = $this->DB->query($sql);
    $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
    return $rowset;
 }

 public function productByID($id)
 {
    $sql = "SELECT * FROM article WHERE id_article ='".$id ."'";
    $sth = $this->DB->query($sql);
    $rowset = $sth->fetch(PDO::FETCH_ASSOC);
    return $rowset;

 }

 public function updateProduct($id, $name, $ref, $desc, $quantity, $weight, $dimension, $picture, $manuId, $idCateg)
 {
   $sql = "UPDATE article SET name = :name, reference = :ref, description = :desc, quantity = :quantity, weight = :weight, ".
          "dimension = :dimension, picture = :picture, manufacturer_id_manufacturer = :manuId, article_category_id_article_category = :idCateg ".
          "WHERE id_article = :id LIMIT 1";

  $array = array(
    ':name' => $name,
    ':ref' => $ref,
    ':desc' => $desc,
    ':quantity' => $quantity,
    ':weight' => $weight,
    ':dimension' => $dimension,
    ':picture' => $picture,
    ':manuId' => $manuId,
    ':idCateg' => $idCateg,
    ':id' => $id);

  $this->DB->query($sql, $array);
  return true;

 }

 public function addProduct($name, $ref, $desc, $quantity, $weight, $dimension, $picture, $manuId, $idCateg)
 {
   $sql = "INSERT INTO article (name, reference, description, quantity, weight, dimension, picture, manufacturer_id_manufacturer, article_category_id_article_category) ".
          "VALUES (:name,:ref,:desc,:quantity,:weight,:dimension,:picture,:manuId,:idCateg)";

  $array = array(
    ':name' => $name,
    ':ref' => $ref,
    ':desc' => $desc,
    ':quantity' => $quantity,
    ':weight' => $weight,
    ':dimension' => $dimension,
    ':picture' => $picture,
    ':manuId' => $manuId,
    ':idCateg' => $idCateg);

  $this->DB->query($sql, $array);
  return true;

 }

 public function deleteProduct($id)
 {
   $sql = "DELETE FROM article WHERE id_article= :id LIMIT 1";

   $array = array(
     ':id' => $id);

   $this->DB->query($sql, $array);
   return true;
 }

public function getCategProducts()
{
  $sql = "SELECT * FROM article_category";
  $sth = $this->DB->query($sql);
  $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
  return $rowset;
}

}
