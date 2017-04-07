<?php

$title_page = 'Spectasonic - Modifier';
include 'header.php';

?>

<div class="wrap">
    
<h1 class="wow fadeIn">Ajouter</h1>
    
<section class="catalogue_products wow fadeInUp">
    <article class="catalogue_products_title back">
        <form>
            <label>REF :</label>
            <input type="text" value="XXX">
            <label>Prix HT :</label>
            <input type="text" value="XXX">
            <label>Quantité :</label>
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
        <i class="fa fa-cloud-upload fa-5x upload-icon" aria-hidden="true"></i>
        <div class="article_products_display_details">
            <p class="article_products_display_details_title">Nom article</p>
            <input class="back_input_name" type="text" value="XXX">
            <p class="article_products_display_details_title">Description</p>
            <textarea></textarea>
            <input type="submit" class="upload-submit" value="Ajouter">
        </div>
    </article>
    </div>
</section>
    
</div>
    
<?php

include 'footer.php';

?>