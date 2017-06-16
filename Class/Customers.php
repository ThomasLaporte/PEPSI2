<?php

class Customers {
   private $DB;

   function __construct($DB) {
     $this->DB = $DB;
   }

   public function connectUser($login, $psw)
   {
     $sql = "SELECT login, admin FROM customer WHERE login = :login AND password = :pswd LIMIT 1;";
     $array = array(
       ':login' => $login,
       ':pswd' => sha1($psw));
      $sth = $this->DB->query($sql, $array);
      return $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function getCustomers()
   {
     $sql = "SELECT * FROM customer";
     $sth = $this->DB->query($sql);
     return  $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function getCustomerById($id)
   {
     $sql = "SELECT * FROM customer WHERE id_customer = :id";
     $array = array(
       ':id' => $id);
     $sth = $this->DB->query($sql, $array);
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
     $sql = "SELECT * FROM price WHERE customer_id_customer = :id";
     $array = array(
       ':id' => $id);
     $sth = $this->DB->query($sql, $array);
     return $sth->fetchAll(PDO::FETCH_ASSOC);
   }

   public function deleteCustomerPrice($idCustomer, $idArticle)
   {
     $sql = "DELETE FROM price WHERE customer_id_customer= :idCustomer AND article_id_article= :idPrice LIMIT 1";

     $array = array(
       ':idCustomer' => $idCustomer,
       ':idPrice' => $idArticle);

      return $this->DB->query($sql, $array);
   }

   public function addPriceCustomer($articleId, $customerId, $fixe, $pourcent)
   {
     $sql = "INSERT INTO price (article_id_article, customer_id_customer, fixe, pourcentage) VALUES (:articleId, :customerId, :fixe, :pourcent)";

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
     "AND a.customer_id_customer = :customerID";

     $array = array(
       ':customerID' => $customerId);
     $sth = $this->DB->query($sql, $array);
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
     $sql = "INSERT INTO customer_adress (adress, postal_code, city, country, type_adress_id_type_address, customer_id_customer) ".
            "VALUES (:adress, :postalCode, :city, :country, :typeAdress, :customerId)";

    $array = array(
      ':adress' => $adress,
      ':postalCode' => $postal,
      ':city' => $city,
      ':country' => $country,
      ':typeAdress' => $adressType,
      ':customerId' => $idCustomer);

    return $this->DB->query($sql, $array);
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
	public function listCustomerMap()
	 {
		$sql = "SELECT c.id_customer,c.customer_name, ca.adress,ca.postal_code, ca.city ,ca.latitude as longitude,ca.longitude as latitude FROM customer c inner join customer_adress ca on ca.customer_id_customer=c.id_customer where ca.longitude is not  null and ca.latitude is not null";
		$sth = $this->DB->query($sql);
		$rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
		return $rowset;
	 }
 }
