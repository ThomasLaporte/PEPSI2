<!doctype html>
<?php session_start();

// Permet de déterminer le niveau d'accés au fichiers
$positionInProject = "";
if(file_exists('../index.php')){ $positionInProject = "../"; } elseif(file_exists('../../index.php')) {$positionInProject = "../../";}?>
<html lang="fr">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title><?php echo $title_page; ?></title>

    <?php echo "<link rel=\"stylesheet\" href=\"".$positionInProject."css/style.css\">";?>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,400,700" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body id="top">
  <header class="wow fadeInDown">
     <?php echo "<a href=\"".$positionInProject."index.php\" class=\"logo\"><img src=\"".$positionInProject."/img/logo.png\"/></a>";?>

    <nav class="horizontal">
        <a href="javascript:void(0);" class="js-modal-close_login" id="open_menu"><i class="fa fa-bars"></i></a>
        <a href="javascript:void(0);" class="js-modal-close_login" id="open_login"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
    </nav>
    <section id="menu">
        <div class="modal-box_menu">
            <div class="modal-body_menu">
                <ul>
                    <li><a class="nav_horizontal_a" href= "<?php echo $positionInProject; ?>index.php">Accueil</a></li>
                    <li><a class="nav_horizontal_a" href= "<?php echo $positionInProject; ?>Article/lstArticles.php">Produits</a></li>
                    <li><a class="nav_horizontal_a" href= "<?php echo $positionInProject; ?>CategArticle/lstCategs.php">Catégories</a></li>
                    <!-- <li><a class="nav_horizontal_a" href="index.php">Fabriquants</a></li> -->
                    <li><a class="nav_horizontal_a" href= "<?php echo $positionInProject; ?>Manufacturer/lstManufacturers.php">Revendeurs</a></li>
                    <!-- <li><a class="nav_horizontal_a" href="panier.php">Langages</a></li> -->
                </ul>
            </div>
            <div class="modal-footer_menu">
                <a href="javascript:void(0);" data-no-instant class="js-modal-close_menu" id="close_menu"><i class="fa fa-times" aria-hidden="true"></i></a>
            </div>
        </div>
    </section>
    <section id="login">
        <div class="modal-box_login">
            <div class="modal-body_login">
                <input type="submit" name="submit" id="sumbit" class="login_submit" value="Deconnexion">
            </div>
            <div class="modal-footer_login">
                <a href="javascript:void(0);" data-no-instant class="js-modal-close_login" id="close_login"><i class="fa fa-times" aria-hidden="true"></i></a>
            </div>
        </div>

    </section>
  </header>
