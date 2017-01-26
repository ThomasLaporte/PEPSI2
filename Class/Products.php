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
   $sql = "UPDATE article ".
          "SET name = '". $name ."',".
          "reference = '". $ref ."',".
          "description = '". $desc ."',".
          "quantity = ". $quantity .",".
          "weight = ". $weight ."f,".
          "dimension = '". $dimension ."',".
          "picture = '". $picture ."',".
          "manufacturer_id_manufacturer = ".$manuId .",".
          "article_category_id_article_category = ".$idCateg .",".
          "WHERE id_article = ".$id;
   $sth = $this->DB->query($sql);
   return true;

 }

 public function addProduct($name, $ref, $desc, $quantity, $weight, $dimension, $picture, $manuId, $idCateg)
 {
   $sql = $sth->prepare("INSERT INTO article (name, reference, description, quantity, weight, dimension, picture, manufacturer_id_manufacturer, article_category_id_article_category) ".
          "VALUES (name = :name,".
          "reference = :ref,".
          "description = :desc,".
          "quantity = :quantity,".
          "weight = :weight,".
          "dimension = :dimension,".
          "picture = :picture,".
          "manufacturer_id_manufacturer = :manuId,".
          "article_category_id_article_category = :idCateg)");

    $sth->bindParam(':name', $name);
    $sth->bindParam(':ref', $ref);
    $sth->bindParam(':desc', $desc);
    $sth->bindParam(':quantity', $quantity);
    $sth->bindParam(':weight', $weight);
    $sth->bindParam(':dimension', $dimension);
    $sth->bindParam(':picture', $picture);
    $sth->bindParam(':manuId', $manuId);
    $sth->bindParam(':idCateg', $idCateg);
   $sth = $this->DB->Execute($sql);
   return true;

 }

 public function deleteProduct($id)
 {
   $sql = "DELETE FROM article WHERE id_article='".$id."'";
   $sth = $this->DB->query($sql);
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
