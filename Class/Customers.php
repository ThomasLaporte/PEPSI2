<?php

class Customers {
   private $DB;

   function __construct($DB) {
     $this->DB = $DB;
   }


   public function getCustomers()
   {
     $sql = "SELECT * FROM customer";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }

   public function getCustomerById($id)
   {
     $sql = "SELECT * FROM customer WHERE id_customer = '". $id ."'";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }


 }
