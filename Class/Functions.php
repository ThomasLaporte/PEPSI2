<?php
require_once("DbConnection.php");
require_once("Products.php");

Class Functions{
  // Instanciation de la connexion à la BDD
  private $_DB;
  private $products;

  function __construct(){
    $this->_DB = new DbConnection();
    $this->products = new Products($this->_DB);
  }

  function getProducts()
  {
    return $this->products->listProducts();
  }
  function getProductByID($id)
  {
    return $this->products->productByID($id);
  }

  function updateProduct($id, $name, $price)
  {
    return $this->products->productByID($id);
  }

  function deleteProduct($id)
  {
    return $this->products->productByID($id);
  }

}