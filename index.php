<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Index</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <header>
      <h1>PEPSI2</h1>
    <?php
    session_start();
    // If the user isn't connected
    if(!isset($_SESSION['user'])){
      // If the user did an error in his logs seizure
      if(isset($_SESSION['error'])){ echo "<a style = 'color:red;'>Votre identifiant ou votre mot de passe est incorrect.</a>";}?>

      <form action="login.php" method="post">
        Login:<br>
        <input type="text" name="login"><br>
        Password:<br>
        <input type="password" name="psw">
        <input type="submit" value="Submit">
      </form>


    <?php
    }
    else {?>
      <a id = "infoUser">Bienvenue <?php echo ($_SESSION['user']['firstname']); ?></a>

    <?php
    }
     ?>



     <hr>
   </header>
  </body>
</html>
