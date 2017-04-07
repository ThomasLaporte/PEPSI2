<?php

$title_page = 'Spectasonic - Panier';
include 'header.php';

?>

<div class="wrap">
    
<h1 class="wow fadeIn">Panier</h1>
    
<section class="catalogue_products wow fadeInUp">
    <article class="catalogue_products_title">
        <h2>Gérer votre panier</h2>
        <p>Gérer votre panier ici.</p>
        <p>Vous pouvez supprimer des articles et visualiser le total HT et TTC.</p>
        <p>Votre panier n'est valable que 15 minutes.</p>
    </article>
    <div class="panier_products_wrap">
    <article class="panier_products_display">
            <ul>
            <li>Total HT<span class="prix_HT">XXX €</span></li>
            <li>Produit 01<span class="prix_HT">XXX €</span><span class="prix_delete"><a href="#"><i class="fa fa-times" aria-hidden="true"></i></a></span></li>
            <li>Produit 02<span class="prix_HT">XXX €</span><span class="prix_delete"><a href="#"><i class="fa fa-times" aria-hidden="true"></i></a></span></li>
            <li>Produit 03<span class="prix_HT">XXX €</span><span class="prix_delete"><a href="#"><i class="fa fa-times" aria-hidden="true"></i></a></span></li>
            <li>Produit 04<span class="prix_HT">XXX €</span><span class="prix_delete"><a href="#"><i class="fa fa-times" aria-hidden="true"></i></a></span></li>
            <li>Total TTC<span class="prix_TTC">XXX €</span></li>
            </ul>
            <button>Payer</button>
    </article>
    </div>
</section>
    
</div>
    
<footer>
</footer>

</body>
    
    <script src="js/script.js"></script>
    
</html>