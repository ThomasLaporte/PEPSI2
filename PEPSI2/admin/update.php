<?php

$title_page = 'Spectasonic - Modifier';
include 'header.php';

?>

<div class="wrap">
    
<h1 class="wow fadeIn">Modifier</h1>
    
<section class="catalogue_products wow fadeInUp">
    <article class="catalogue_products_title back">
        <h2>Nom article</h2>
        <form>
            <label>REF :</label>
            <input type="text" value="XXX">
            <label>TVA :</label>
            <input type="text" value="XXX">
            <label>Prix HT :</label>
            <input type="text" value="XXX">
            <label>Prix TTC :</label>
            <input type="text" value="XXX">
            <label>En stock :</label>
            <input type="text" value="XXX">
            <label>Fabriquant :</label>
            <select>
                <option>AAA</option>
                <option>AAA</option>
            </select>
            <label>Dimensions :</label>
            <input type="text" value="XXX">
            <label>Poids :</label>
            <input type="text" value="XXX">
            <label>Catégorie :</label>
            <select>
                <option>AAA</option>
                <option>AAA</option>
            </select>
            <label for="file" class="label-file">Choisir une image</label>
            <input id="file" class="input-file" type="file">
        </form>
    </article>
    <div class="catalogue_products_wrap back">
    <article class="article_products_display">
        <a href="#" class="article_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
        <div class="article_products_display_details">
            <p class="article_products_display_details_title">Nom article</p>
            <input class="back_input_name" type="text" value="XXX">
            <p class="article_products_display_details_title">Description</p>
            <textarea></textarea>
            <button>Modifier</button>
        </div>
    </article>
    </div>
</section>
    
</div>
    
<?php

include 'footer.php';

?>