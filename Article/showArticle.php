<?php
  $title_page = 'Spectasonic - Article';
  include '../header.php';
  include "../Class/Functions.php";

  $lstFunctions = new Functions();

  $currentProduct = $lstFunctions->getProductByID($_GET['product']);
?>

<div class="wrap">

<h1 class="wow fadeIn">Article</h1>

<section class="catalogue_products wow fadeInUp">
    <article class="catalogue_products_title back">
        <h2><?php echo $currentProduct['name']; ?></h2>
        <ul>
            <li>REF : <?php echo $currentProduct['reference']; ?></li>
            <li>TVA : XXX</li>
            <li>Prix HT : <?php echo $currentProduct['name']."€"; ?></li>
            <li>Prix TTC : XXX</li>
            <li>En stock : <?php echo $currentProduct['quantity']; ?></li>
            <li>Fabriquant : <?php echo $currentProduct['name']; ?></li>
            <li>Dimension : XXX</li>
            <li>Poids : XXX</li>
            <li>Catégorie : <a href="index.php#lampes">XXX</a></li>
        </ul>
        <a href="ajout.php"><i class="fa fa-times fa-2x a_delete" aria-hidden="true"></i></a>
    </article>
    <div class="catalogue_products_wrap">
    <article class="article_products_display">
        <a class="article_img_link"><img src="http://lorempixel.com/output/city-q-c-250-175-4.jpg" /></a>
        <div class="article_products_display_details">
            <p class="article_products_display_details_title">Nom article</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper dignissim ligula sit amet pharetra. Praesent ullamcorper ex in justo condimentum tincidunt. Aliquam fermentum eros vel velit dapibus volutpat. Aliquam mollis libero a tincidunt tincidunt. Maecenas molestie lorem urna, sed vestibulum est sagittis non. Praesent viverra eu nunc id fringilla. Vestibulum ut tempor elit. Nunc facilisis vel arcu efficitur vestibulum. In semper rhoncus felis quis ullamcorper. Morbi rhoncus nec sem eget convallis. Maecenas scelerisque sagittis leo, gravida vulputate eros mollis ut.</p>
            <p>Aliquam sed nisi dignissim, venenatis dui nec, laoreet metus. Vestibulum blandit purus nec neque vehicula lobortis. Praesent dignissim condimentum ex eu interdum. Donec at iaculis urna. Maecenas non augue lacus. Nam id purus in urna tristique posuere. Nullam eleifend, orci eu tincidunt vulputate, ante mauris commodo nisl, eu elementum metus lacus id magna. Pellentesque quis cursus magna. Suspendisse fermentum enim non porttitor tristique. Sed finibus arcu enim, a ultrices mauris auctor sit amet.</p>
        </div>
    </article>
    </div>
</section>

</div>

<?php
include '../footer.php';
?>