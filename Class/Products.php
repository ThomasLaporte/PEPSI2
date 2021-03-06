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
        return $sth->fetchAll(PDO::FETCH_ASSOC);
     }

     public function productByID($id)
     {
        $sql = "SELECT * FROM article WHERE id_article = :id";
        $array = array(
          ':id' => $id);
        $sth = $this->DB->query($sql, $array);
        return $sth->fetch(PDO::FETCH_ASSOC);
     }

     public function updateProduct($id, $name, $ref, $quantity, $price, $weight, $dimension, $picture, $manuId, $idCateg, $idLangCateg)
     {
       $sql = "UPDATE article SET name = :name, reference = :ref,  quantity = :quantity, public_price = :price, weight = :weight, ".
              "dimension = :dimension, picture = :picture, manufacturer_id_manufacturer = :manuId, article_category_code = :idCateg, article_category_language_id_language = :idLangCateg ".
              "WHERE id_article = :id LIMIT 1";

      $array = array(
        ':id' => $id,
        ':name' => $name,
        ':ref' => $ref,
        ':quantity' => $quantity,
        ':price' => $price,
        ':weight' => $weight,
        ':dimension' => $dimension,
        ':picture' => $picture,
        ':manuId' => $manuId,
        ':idCateg' => $idCateg,
        ':idLangCateg' => $idLangCateg);

      return $this->DB->query($sql, $array);
     }

     public function addProduct($name, $ref, $quantity, $price, $weight, $dimension, $picture, $manuId, $idCateg, $idLangCateg)
     {
        $sql = "INSERT INTO article (name, reference, quantity, public_price, weight, dimension, picture, manufacturer_id_manufacturer, article_category_code, article_category_language_id_language) ".
              "VALUES (:name,:ref, :quantity, :price, :weight, :dimension, :picture, :manuId, :idCateg, :idCategLang)";

        $array = array(
          ':name' => $name,
          ':ref' => $ref,
          ':quantity' => $quantity,
          ':price' => $price,
          ':weight' => $weight,
          ':dimension' => $dimension,
          ':picture' => $picture,
          ':manuId' => $manuId,
          ':idCateg' => $idCateg,
          'idCategLang' => $idLangCateg);

        return $this->DB->query($sql, $array);
     }

     public function deleteProduct($id)
     {
       $sql = "DELETE FROM article WHERE id_article= :id LIMIT 1";

       $array = array(
         ':id' => $id);

      return $this->DB->query($sql, $array);
     }

     public function addCharacteristic($articleId, $desc, $spec, $idLanguage)
     {
        $sql = "INSERT INTO characteristics (article_id_article, description, specification, language_id_language) VALUES (:idArticle, :desc, :spec, :idLanguage)";

        $array = array(
          ':idArticle' => $articleId,
          ':desc' => $desc,
          ':spec' => $spec,
          ':idLanguage' => $idLanguage);
        return $this->DB->query($sql, $array);
     }

     public function deleteCharacteristic($articleId)
     {
         $sql = "DELETE FROM characteristics WHERE article_id_article = :id";
         $array = array(
           ':id' => $articleId);

         return $this->DB->query($sql, $array);
     }

     public function updateCharacteristic($articleId, $desc, $spec, $idLanguage){
       $sql = "UPDATE characteristics SET description = :desc, specification = :spec WHERE article_id_article = :articleId AND language_id_language = :idLanguage LIMIT 1";

      $array = array(
        ':desc' => $desc,
        ':spec' => $spec,
        ':articleId' => $articleId,
        ':idLanguage' => $idLanguage);

      return $this->DB->query($sql, $array);
     }

     public function getCharacteristicsByIdArticle($idArticle)
     {
       $sql = "SELECT * FROM characteristics WHERE article_id_article = :articleId";
       $array = array(
         ':articleId' => $idArticle);
       $sth = $this->DB->query($sql, $array);
       return $sth->fetchAll(PDO::FETCH_ASSOC);
     }

     public function getProductByCateg($categId)
     {
        $sql = "SELECT * FROM article WHERE article_category_code ='".$categId ."'";
        $sth = $this->DB->query($sql);
        return $sth->fetchAll(PDO::FETCH_ASSOC);
     }
}
