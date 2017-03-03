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

  function addProduct($name, $ref, $quantity, $weight, $dim, $pict, $manuId, $categ)
  {
    $idArticle = $this->products->addProduct($name, $ref, $quantity, $weight, $dim, $pict, $manuId, $categ);
    $this->products->addCharacteristic($idArticle); // Id Article
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

  // Categorie article
  function addArticleCategorie($name, $code, $idLanguage)
  {
    return $this->products->addArticleCateg($name, $code, $idLanguage);
  }

  function getMaxCodeFromCategProd()
  {
    return $this->products->getLastCodeFromCategProd();
  }

  function getProductsCategs()
  {
    return $this->products->getCategProducts();
  }
  function getProductsCategsByLang($language)
  {
    return $this->products->getProductsCategsByLang($language);
  }

  function getLanguages(){
    return $this->products->listLanguages();
  }


}
