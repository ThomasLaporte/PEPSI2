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

   public function updateCustomer($idCustomer, $companyName, $name, $email, $phone, $mobile, $fax, $admin)
   {
     $sql = "UPDATE custumer SET name = :name, adress = :adress, postal_code = :postal, city = :city, country = :country ".
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


   public function getPricesByCustomerId($id)
   {
     $sql = "SELECT * FROM Price WHERE customer_id_customer = '". $id ."'";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }

   public function addPriceCustomer($articleId, $customerId, $fixe, $pourcent)
   {
     $sql = "INSERT INTO Price (article_id_article, customer_id_customer, fixe, pourcentage) VALUES (:articleId, :customerId, :fixe, :pourcent)";

    $array = array(
      ':articleId' => $articleId,
      ':customerId' => $customerId,
      ':fixe' => $fixe,
      ':pourcent' => $pourcent);

    return $this->DB->query($sql, $array);
   }

   public function getAdressesCustomer($customerId)
   {
     $sql = "SELECT a.*, t.name As adressType ".
     "FROM pepsi2.customer_adress As a, pepsi2.type_adress As t ".
     "WHERE a.type_adress_id_type_address = t.id_type_address ".
     "AND a.customer_id_customer = '". $customerId ."'";
    //  $sql = "SELECT * FROM customer_adress WHERE customer_id_customer = '". $customerId ."'";
     $sth = $this->DB->query($sql);
     $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
     return $rowset;
   }


 }
