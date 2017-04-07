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
     return  $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function getCustomerById($id)
   {
     $sql = "SELECT * FROM customer WHERE id_customer = '". $id ."'";
     $sth = $this->DB->query($sql);
     return  $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function updateCustomer($idCustomer, $companyName, $name, $email, $phone, $mobile, $fax, $function, $admin)
   {
     $sql = "UPDATE customer SET customer_name = :companyName, name = :name, email = :email, phone = :phone, mobile = :mobile, fax = :fax, function = :function, admin = :admin ".
            "WHERE id_customer = :idCustomer LIMIT 1";

    $array = array(
      ':idCustomer' => $idCustomer,
      ':companyName' => $companyName,
      ':name' => $name,
      ':email' => $email,
      ':phone' => $phone,
      ':mobile' => $mobile,
      ':fax' => $fax,
      ':function' => $function,
      ':admin' => $admin);


    return $this->DB->query($sql, $array);
   }


   public function getPricesByCustomerId($id)
   {
     $sql = "SELECT * FROM Price WHERE customer_id_customer = '". $id ."'";
     $sth = $this->DB->query($sql);
     return $sth->fetchAll(PDO::FETCH_ASSOC);
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
     return $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function updateAdressCustomer($idAdress, $adress, $postal, $city, $country)
   {
     $sql = "UPDATE customer_adress SET adress = :adress, postal_code = :postal, city = :city, country = :country ".
            "WHERE id_adress = :id LIMIT 1";

    $array = array(
      ':id' => $idAdress,
      ':adress' => $adress,
      ':postal' => $postal,
      ':city' => $city,
      ':country' => $country);

      var_dump($array);
    return $this->DB->query($sql, $array);
   }

   public function addCustomer($login, $password, $companyName, $name, $email, $phone, $mobile, $fax, $function, $admin)
   {
     $sql = "INSERT INTO customer (login, password, customer_name, name, email, phone, mobile, fax, function, admin) ".
            "VALUES (:login, :password, :companyName, :name, :email, :phone, :mobile, :fax, :function, :admin)";

    $array = array(
      ':login' => $login,
      ':password' => $password,
      ':companyName' => $companyName,
      ':name' => $name,
      ':email' => $email,
      ':phone' => $phone,
      ':mobile' => $mobile,
      ':fax' => $fax,
      ':function' => $function,
      ':admin' => $admin);

    return $this->DB->query($sql, $array);
   }

   public function addCustomerAdress($idCustomer, $adress, $postal, $city, $country, $adressType)
   {

   }


   public function deleteCustomer($idCustomer)
   {
     $sql = "DELETE FROM customer WHERE id_customer= :id LIMIT 1";

     $array = array(
       ':id' => $idCustomer);

      return $this->DB->query($sql, $array);
   }

   public function getAdressTypes()
   {
     $sql = "SELECT * FROM type_adress";
        $sth = $this->DB->query($sql);
        return $sth->fetchAll(PDO::FETCH_ASSOC);
   }
 }
