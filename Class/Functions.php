<?php
require_once("DbConnection.php");
require_once("Products.php");
require_once("Manufacturers.php");
require_once("ProductCategs.php");
require_once("Languages.php");
require_once("Customers.php");

Class Functions{
  // Instanciation de la connexion à la BDD
  private $_DB;
  private $products;
  private $manufacturers;
  private $productCategs;
  private $languages;
  private $customers;

  function __construct(){
    $this->_DB = new DbConnection();
    $this->products = new Products($this->_DB);
    $this->manufacturers = new Manufacturers($this->_DB);
    $this->productCategs = new ProductCategs($this->_DB);
    $this->languages = new Languages($this->_DB);
    $this->customers = new Customers($this->_DB);
  }

  // Produits
  function getProducts()
  {
    return $this->products->listProducts();
  }
  function getProductByID($id)
  {
    return $this->products->productByID($id);
  }

  function updateProduct($id, $name, $ref, $quantity, $price, $weight, $dimension, $picture, $manuId, $idCateg, $idLangCateg)
  {
    return $this->products->updateProduct($id, $name, $ref, $quantity, $price, $weight, $dimension, $picture, $manuId, $idCateg, $idLangCateg);
  }

  function deleteProduct($id)
  {
    return $this->products->deleteProduct($id);
  }

  function addProduct($name, $ref, $quantity, $price, $weight, $dimension, $picture, $manuId, $idCateg, $idLangCateg)
  {
    return $this->products->addProduct($name, $ref, $quantity, $price, $weight, $dimension, $picture, $manuId, $idCateg, $idLangCateg);
  }

  function getProductByCateg($categId)
  {
      return $this->products->getProductByCateg($categId);
  }

  // Caractéristiques produit
  function addCharacteristic($articleId, $desc, $spec, $idLanguage)
  {
    return $this->products->addCharacteristic($articleId, $desc, $spec, $idLanguage);
  }

  function deleteCharacteristic($articleId)
  {
    return $this->products->deleteCharacteristic($articleId);
  }

  function updateCharacteristic($articleId, $desc, $spec, $idLanguage)
  {
    return $this->products->updateCharacteristic($articleId, $desc, $spec, $idLanguage);
  }

  function getCharacteristicsByIdArticle($idArticle)
  {
    return $this->products->getCharacteristicsByIdArticle($idArticle);
  }

  // Fournisseurs
  function getManufacturers()
  {
    return $this->manufacturers->listManufacturers();
  }

  function addManufacturer($name, $adress, $postal, $city, $country)
  {
    return $this->manufacturers->addManufacturer($name, $adress, $postal, $city, $country);
  }

  function deleteManufacturer($id)
  {
    return $this->manufacturers->deleteManufacturer($id);
  }

  function updateManufacturer($id, $name, $adress, $postalCode, $city, $country)
  {
    return $this->manufacturers->updateManufacturer($id, $name, $adress, $postalCode, $city, $country);
  }

  function getManufacturerById($id)
  {
    return $this->manufacturers->getManufacturerById($id);
  }

  // Pays
  function getCountries()
  {
    return $this->manufacturers->getCountries();
  }

  function getCountryById($id)
  {
      return $this->manufacturers->getCountryById($id);
  }

  // Categorie article
  function addArticleCategorie($name, $code, $idLanguage, $desc)
  {
    return $this->productCategs->addArticleCateg($name, $code, $idLanguage, $desc);
  }

  function getMaxCodeFromCategProd()
  {
    return $this->productCategs->getLastCodeFromCategProd();
  }

  function getProductsCategs()
  {
    return $this->productCategs->getProductCategs();
  }

  function getProductCategByID($categId)
  {
    return $this->productCategs->getProductCategByID($categId);
  }

  function updateProductCateg($id, $name, $idLanguage, $description)
  {
    return $this->productCategs->updateProductCateg($id, $name, $idLanguage, $description);
  }

  function deleteProductCateg($id)
  {
    return $this->productCategs->deleteProductCateg($id);
  }

  function getProductsCategsByLang($language)
  {
    return $this->productCategs->getProductsCategsByLang($language);
  }

  // Langue
  function getLanguages()
  {
    return $this->languages->listLanguages();
  }

  function addLanguage($name)
  {
    return $this->languages->addLanguage($name);
  }

  function deleteLanguage($id)
  {
    return $this->languages->deleteLanguage($id);
  }

  function getLanguageByIdBis($id)
  {
    return $this->languages->getLanguageById($id);
  }

  // Clients
  function getCustomers()
  {
    return $this->customers->getCustomers();
  }

  function getCustomerById($id)
  {
    return $this->customers->getCustomerById($id);
  }

  function updateCustomer($idCustomer, $companyName, $name, $email, $phone, $mobile, $fax, $function, $admin)
  {
    return $this->customers->updateCustomer($idCustomer, $companyName, $name, $email, $phone, $mobile, $fax, $function, $admin);
  }

  function getPricesByCustomerId($id)
  {
    return $this->customers->getPricesByCustomerId($id);
  }

  function deleteCustomerPrice($idCustomer, $idArticle)
  {
    return $this->customers->deleteCustomerPrice($idCustomer, $idArticle);
  }

  function addPriceCustomer($articleId, $customerId, $fixe, $pourcent)
  {
    return $this->customers->addPriceCustomer($articleId, $customerId, $fixe, $pourcent);
  }

  function getAdressesCustomer($customerId)
  {
    return $this->customers->getAdressesCustomer($customerId);
  }

  function updateAdressCustomer($idAdress, $adress, $postal, $city, $country)
  {
    return $this->customers->updateAdressCustomer($idAdress, $adress, $postal, $city, $country);
  }

  function addCustomer($login, $password, $companyName, $name, $email, $phone, $mobile, $fax, $function, $admin)
  {
    return $this->customers->addCustomer($login, $password, $companyName, $name, $email, $phone, $mobile, $fax, $function, $admin);
  }

  function addCustomerAdress($idCustomer, $adress, $postal, $city, $country, $adressType)
  {
    return $this->customers->addCustomerAdress($idCustomer, $adress, $postal, $city, $country, $adressType);
  }

  function deleteCustomer($customerId)
  {
     return $this->customers->deleteCustomer($customerId);
  }

  function getAdressTypes()
  {
    return $this->customers->getAdressTypes();
  }
}
