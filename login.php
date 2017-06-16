<?php
  include 'header.php';

  include 'Class/Functions.php';

  echo $_POST['login'];
  if(isset($_POST['login']) && isset($_POST['pswd']))
  {
    $lstFunctions = new Functions();
    $currentUser = $lstFunctions->connectUser($_POST['login'], $_POST['pswd']);

    if(count($currentUser) > 1)
    {
      $_SESSION['user'] = $currentUser;
      unset($_SESSION['error']);
    }
    else {
      $_SESSION['error'] = 1;
    }
  }
  header('Location: /Article/lstArticles.php');
