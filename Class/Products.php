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

     public function addProduct($name, $ref, $quantity, $weight, $dimension, $picture, $manuId, $idCateg)
     {
       $sql = "INSERT INTO article (name, reference, quantity, weight, dimension, picture, manufacturer_id_manufacturer, article_category_id_article_category) ".
              "VALUES (:name,:ref,:quantity,:weight,:dimension,:picture,:manuId,:idCateg)";

      $array = array(
        ':name' => $name,
        ':ref' => $ref,
        ':quantity' => $quantity,
        ':weight' => $weight,
        ':dimension' => $dimension,
        ':picture' => $picture,
        ':manuId' => $manuId,
        ':idCateg' => $idCateg);

        var_dump($this->DB->query($sql, $array));
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
      $sql = "SELECT id_article_category, name FROM article_category";
      $sth = $this->DB->query($sql);
      $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
      return $rowset;
    }

    public function getProductsCategsByLang($idlanguage)
    {
      $sql = "SELECT id_article_category, name FROM article_category WHERE language_idlanguage = :idLanguage";
      $array = array(
        ':idLanguage' => $idlanguage);
      $sth = $this->DB->query($sql, $array);
      $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
      return $rowset;
    }

    public function getLastCodeFromCategProd()
    {
      $sql = "SELECT MAX(code) FROM article_category";
      $sth = $this->DB->query($sql);
      $rowset = $sth->fetch(PDO::FETCH_ASSOC);
      return $rowset;
    }

    public function addArticleCateg($name, $code, $idLanguage)
    {
      $sql = "INSERT INTO article_category (name, code, language_idlanguage) VALUES (:name, :code, :idLanguage)";

     $array = array(
       ':name' => $name,
       ':code' => $code,
       ':idLanguage' => $idLanguage);

     $this->DB->query($sql, $array);
     return true;

    }

    public function listLanguages()
    {
      $sql = "SELECT * FROM language";
      $sth = $this->DB->query($sql);
      $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
      return $rowset;
    }

}
