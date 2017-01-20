<?php   include 'Class/Functions.php'; ?>
<!DOCTYPE html>
<html>
  <head>
    <title> Modifier produit </title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <?php
    $lstFunctions = new Functions();

    // Si l'utilisateur clic sur le bouton valider apres aviur fait ses modifications
    if(isset($_POST['productName']))
    {
          // Si l'update a été fonctionné
         if($lstFunctions->updateProduct($_POST['productName'], $_POST['productPrice'])){

         }
         else {
           # code...
         }
    }


    if(isset($_GET['product'])){
      $currentProduct = $lstFunctions->getProductByID($_GET['product']);
      ?>
      <form method="post">
          Nom du produit: <input type="text" name="productName" placeholder="<?php echo $currentProduct['name'] ?>"><br>
          Prix du produit:<input type="text" name="productPrice" placeholder="<?php echo $currentProduct['name'] ?>"><br>
          <input type="submit" value="Submit">
      </form>

<?php }
  else {
    header("Location:http://192.168.33.10/");
  } ?>
  </body>
</html>
