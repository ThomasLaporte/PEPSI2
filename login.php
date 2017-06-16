<?php
  include 'header.php';

  include 'Class/Functions.php';

  if(isset($_POST['login']) && isset($_POST['pswd']))
  {
    $lstFunctions = new Functions();
    $currentUser = $lstFunctions->connectUser($_POST['login'], $_POST['pswd']);
    if(count($currentUser) > 0)
    {
      $_SESSION['user'] = $currentUser;
      unset($_SESSION['error']);
      var_dump($currentUser[0]);
      if($currentUser[0]["admin"] == "1"){
        header('Location: admin/Article/lstArticles.php');
        exit;
      }
    }
    else {
      $_SESSION['error'] = 1;
    }
  }
  header('Location: /Article/lstArticles.php');
