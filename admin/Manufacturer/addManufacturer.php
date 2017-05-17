<?php
  include '../../Class/Functions.php';
  $title_page = 'Spectasonic - Catalogue Backoffice';
  require_once '../../header.php';

  $lstFunctions = new Functions();

    if(isset($_POST['addBtn']))
    {
       if($lstFunctions->addManufacturer($_POST['manufacturerName'], $_POST['manufacturerAdress'], $_POST['manufacturerPostal'], $_POST['manufacturerCity'],$_POST['manufacturerCountry'])){ // $_POST['productCateg']
          ?> <script>alert("Ajout effectué avec succés ! ");</script><?php
        }
        else {
          ?> <script>alert("Problème rencontré lors de l'ajout ! ");</script><?php
        }
      unset($_POST['addBtn']);
    }
    ?>
    <form method="post">
      <div class="wrap">
      <h1 class="wow fadeIn">Ajout d'un fournisseur</h1>
        <section class="catalogue_products wow fadeInUp">
            <div class="catalogue_products_wrap back">
                  <article class="article_products_display">
                      <div class="article_products_display_details">
                        <p class="article_products_display_details_title">Raison sociale :</p>
                        <input name="manufacturerName" required class="back_input_name" type="text" value="">
                        <p class="article_products_display_details_title">Adresse :</p>
                        <input name="manufacturerAdress" required class="back_input_name" type="text" value="">
                        <p class="article_products_display_details_title">Code Postal :</p>
                        <input name="manufacturerPostal" required class="back_input_name" type="text" value="">
                        <p class="article_products_display_details_title">Ville :</p>
                        <input name="manufacturerCity" required class="back_input_name" type="text" value="">

                        <p class="article_products_display_details_title">Pays :</p>
                        <select name="manufacturerCountry"><?php
                        foreach ($lstFunctions->getCountries() as $country) {?>
                          <option value="<?php echo $country['id']; ?>"><?php echo $country['nom_fr_fr']; ?></option><?php
                        }?>
                        </select>";
                      </div>
                  </article>
              <button name="addBtn">Ajouter</button>
            </div>
        </section>
      </div>
    </form>

    <?php
    include '../../footer.php';
    ?>
