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


}
