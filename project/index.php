<?php

$title_page = 'Spectasonic - Catalogue';
include 'header.php';

//require_once("backoffice/Class/DbConnection.php");
require_once("backoffice/Class/Functions.php");



$MultiLang = 1; // Initialisation du MultiLangue, 1 = FR; 2 = EN
$content = "";  // Initialisation du content

// Tronquer a x caractères 
function tronquer($texte,$n)
{
    if (strlen($texte) > $n)
    {    
        $texte = substr($texte, 0, $n);    
        $position_espace = strrpos($texte, " ");    
        $texte = substr($texte, 0, $position_espace);    
        $texte .= '...';
        return $texte;
    }
    else return $texte;
}

// Recupération des articles présent dans la BDD/DB
function getArticlesBis(){
  $sql = "SELECT a.id_article,a.name,a.reference,a.weight,a.quantity,a.dimension,a.picture,ch.description,ch.specification,m.name as manufacturer,a.article_category_id_article_category
FROM article a 
INNER JOIN characteristics ch ON ch.article_id_article=a.id_article
INNER JOIN manufacturer m ON a.manufacturer_id_manufacturer=m.id_manufacturer";
  $sth = $_DB->query($sql);
  $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
  return $rowset;

}

 // Recupération des catégories présentes dans la BDD/DB
function getArticleCategs(){
  $sql = "SELECT id_article_category, name FROM article_category";
  $sth = $_DB>query($sql);
  $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
  return $rowset;
}

$lstFunctions = new Functions();
    

$content .= "<div class='wrap'>";
$content .= "<h1 class='wow fadeIn'> CATALOGUE </h1>";



//var_dump($lstFunctions->getArticlesBis());
//var_dump($lstFunctions->getProductsCategs());
//Création dynamique des catégories et implémentation des articles associés
foreach ($lstFunctions->getProductsCategs() as $Categ)
{
    $content .= "<section class='catalogue_products wow fadeInUp'>";
    $content .= "<article class='catalogue_products_title'>";
    $content .= "<h2 id=". $Categ['name'] .">". $Categ['name'] ."</h2>";
    $content .= "<p>". $Categ['description'] ."</p>";
    $content .= "</article>";

    // Création dynamique des articles dans la catégorie actuelle
    foreach ($lstFunctions->getArticlesBis() as $Article)
    {
            $content .= "<article class='catalogue_products_display'>";
            $content .= "<a href='#' class=img_link'><img src=\"". $Article['picture'] ."\" /></a>";
            $content .= "<div class='catalogue_products_display_details'>";
            $content .= "<p class='catalogue_products_display_details_title'>". $Article['name'] ."</p>";
            $content .= "<p>". $Article['description'] ."<a href=article.php?id=". $Article['id_article'] .">Lire la suite</a></p>";
            $content .= "</div>";
            $content .= "</article>";
    }

    $content .= "</section>"; 
}

$content .= "</article>";
$content .= "</div>";
  
$content .= "</div>";

echo($content);

include 'footer.php';

?>