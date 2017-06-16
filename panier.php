<?php

$title_page = 'Spectasonic - Panier';
include 'header.php';
include "Class/Functions.php";

$lstFunctions = new Functions();

?>

<div class="wrap">

<h1 class="wow fadeIn">Panier</h1>

<section class="catalogue_products wow fadeInUp">
    <article class="catalogue_products_title">
        <h2>Gérer votre panier</h2>
        <p>Gérer votre panier ici.</p>
        <p>Vous pouvez supprimer des articles et visualiser le total HT et TTC.</p>
        <p>TVA appliquée : 20%</p>
    </article>
    <div class="panier_products_wrap">
    <article class="panier_products_display">
            <ul>
              <?php
              $prixHT = 0;
              if(isset($_SESSION['panier'])){
                foreach ($_SESSION['panier'] as $idProd => $quantity){
                    $currentProduct = $lstFunctions->getProductByID($idProd); ?>
                    <li class="prix_li"><?php echo $currentProduct['name']; ?><span class="prix_HT"><?php echo intval($currentProduct['public_price']) * $quantity ."€"?></span><span class="prix_delete"><a href="javascript:void(0)" class="prix_a"><i class="fa fa-times" aria-hidden="true"></i></a></span></li>
                <?php
                $prixHT += intval($currentProduct['public_price']) * $quantity;
                }
            }?>
            <hr>
            <li>Total HT<span class="prix_HT"><?php echo $prixHT; ?> €</span></li>
            <li>Total TTC<span class="prix_TTC"><?php echo $prixHT * 1.2; ?> €</span></li>
            </ul>
            <button>Payer</button>
    </article>
    </div>
</section>

</div>

<?php

include 'footer.php';

?>
