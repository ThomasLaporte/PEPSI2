<?php
session_start();

$title_page = 'Spectasonic - Panier';

include "functions_panier.php";
include '../header.php';
include "../Class/Functions.php";


foreach ($Article as $key => $) {
    # recuperer article et stocker dans content

};

// <--- Menu gauche --->
$content = "";
$content .= "<div class=\"wrap\">";
    $content .= "<h1 class=\"wow fadeIn\">Panier</h1>";
    $content .= "<section class=\"catalogue_products wow fadeInUp\">";
        $content .= "<article class=\"catalogue_products_title\">";
            $content .= "<h2>Gérer votre panier</h2>";
                $content .= "<p>Gérer votre panier ici.</p>";
                $content .= "<p>Vous pouvez supprimer des articles et visualiser le total HT et TTC.</p>";
                $content .= "<p>Votre panier n'est valable que 15 minutes.</p>";
        $content .= "</article>";
// <!--- Menu gauche ---!>

// <--- Contenu du panier --->
        $content .= "<div class=\"panier_products_wrap\">";
            $content .= "<article class=\"panier_products_display\">";
                $content .= "<ul>";
                $content .= "<li>Total HT<span class=\"prix_HT\">" . $PrixHT['public_price'] . "€</span></li>"; // SOMME TOUT PRIX HT 

                foreach ($ProduitPanier as $Article)
                {
                $content .=   "<li class=\"prix_li\">" . $Article['name'] . "<span class=\"prix_HT\">" . $Article['public_price'] . "€</span><span class=\"prix_delete\"><a href=\"javascript:void(0)\" class=\"prix_a\"><i class=\"fa fa-times\" aria-hidden=\"true\"></i></a></span></li>";  // Recup tout les articles
                };
                $content .= "<li>Total TTC<span class=\"prix_TTC\">" . $PrixTTC['public_price'] . "€</span></li>";
                $content .= "</ul>";
                $content .= "<button>Payer</button>";
            $content .= "</article>";
        $content .= "</div>";
    $content .= "</section>";
$content .= "</div>";
// <!--- Contenu du panier ---!>


// <--- AFFICHAGE --->
echo $content;
// <!--- AFFICHAGE ---!> 


include '../footer.php';

?>
