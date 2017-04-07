<?php

class Languages {
   private $DB;

   function __construct($DB) {
     $this->DB = $DB;
   }


   public function listLanguages()
   {
     $sql = "SELECT * FROM language";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }

   public function addLanguage($name)
   {
     $sql = "INSERT INTO language (name) VALUES (:name)";

    $array = array(
      ':name' => $name);

    return $this->DB->query($sql, $array);

   }

    public function deleteLanguage($id)
    {
      $sql = "DELETE FROM language WHERE idlanguage= :id LIMIT 1";

      $array = array(
        ':id' => $id);

       $this->DB->query($sql, $array);
       return true;
    }

    public function getLanguageById($id)
    {
      $sql = "SELECT * FROM language WHERE idlanguage ='".$id ."'";
      $sth = $this->DB->query($sql);
      $rowset = $sth->fetch(PDO::FETCH_ASSOC);
      return $rowset;
    }
 }
