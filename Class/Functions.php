<?php
require_once("DbConnection.php");
require_once("Products.php");
require_once("Manufacturers.php");

Class Functions{
  // Instanciation de la connexion à la BDD
  private $_DB;
  private $products;
  private $manufacturers;

  function __construct(){
    $this->_DB = new DbConnection();
    $this->products = new Products($this->_DB);
    $this->manufacturers = new Manufacturers($this->_DB);
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

  function updateProduct($id, $name, $ref, $desc, $quantity, $weight, $dim, $pict, $manuId, $categ)
  {
    return $this->products->updateProduct($id, $name, $ref, $desc, $quantity, $weight, $dim, $pict, $manuId, $categ);
  }

  function deleteProduct($id)
  {
    return $this->products->deleteProduct($id);
  }

  function addProduct($name, $ref, $desc, $quantity, $weight, $dim, $pict, $manuId, $categ)
  {
    return $this->products->addProduct($name, $ref, $desc, $quantity, $weight, $dim, $pict, $manuId, $categ);
  }

  function getProductsCategs()
  {
    return $this->products->getCategProducts();
  }

  // Fournisseurs
  function getManufacturers()
  {
    return $this->manufacturers->listManufacturers();
  }

  function addManufacturer($name, $adress, $postal, $city, $country)
  {
    return $this->products->addManufacturer($name, $adress, $postal, $city, $country);
  }

}
