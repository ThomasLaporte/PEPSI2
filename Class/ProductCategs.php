<?php

class ProductCategs {
   private $DB;

   function __construct($DB) {
     $this->DB = $DB;
   }

   public function getProductCategs()
   {
     $sql = "SELECT code, name FROM article_category";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }

   public function getProductsCategsByLang($idlanguage)
   {
     $sql = "SELECT code, name, description FROM article_category WHERE language_id_language = :idLanguage";
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

   public function addArticleCateg($name, $code, $idLanguage, $description)
   {
     $sql = "INSERT INTO article_category (name, code, language_id_language, description) VALUES (:name, :code, :idLanguage, :desc)";

    $array = array(
      ':name' => $name,
      ':code' => $code,
      ':idLanguage' => $idLanguage,
      ':desc' => $description);

    return $this->DB->query($sql, $array);

   }

   public function getProductCategByID($categID)
   {
     $sql = "SELECT * FROM article_category WHERE code = :categId";
     $array = array(
       ':categId' => $categID);

     $sth = $this->DB->query($sql, $array);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }

   public function deleteProductCateg($id)
   {
     $sql = "DELETE FROM article_category WHERE code = :id";

     $array = array(
       ':id' => $id);

     return $this->DB->query($sql, $array);
   }

   public function updateProductCateg($id, $name, $idLanguage, $description)
   {
     $sql = "UPDATE article_category SET name = :name, description = :desc ".
            "WHERE code = :id AND language_id_language = :languageId LIMIT 1";

    $array = array(
      ':name' => $name,
      ':languageId' => $idLanguage,
      ':id' => $id,
      ':desc' => $description);

    return $this->DB->query($sql, $array);

   }

 }
