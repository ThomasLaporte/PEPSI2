<?php   include 'Class/Functions.php'; ?>
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Ajout d'un nouveau produit</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <h1>Ajout d'un nouveau produit</h1>
    <form method="post">
        Reference: <input type="text" name="productRef"><br>
        Nom du produit: <input type="text" name="productName"><br>
        Designation: <input type="text" name="productDesi"><br>
        Designation complète: <input type="text" name="productDesiComp"><br>
        Poids (en Kg): <input type="text" name="productWeight"><br>
        Image: <input type="file" name="productName"><br>
        Livraison: <input type="number" name="productDelivery"><br>
        Dimensions: <input type="text" name="productSize"><br>
        Quantité disponible: <input type="number" name="productQuantity"><br>
        Catégorie: <input type="number" name="productCateg"><br>
        <input type="submit" value="Submit">
    </form>



  </body>
  </html>
