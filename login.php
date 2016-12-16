<?php
  include('bddConnection.php');
  $sql = "SELECT * FROM PEPSI2.users WHERE login='".$_POST['login']."' AND password='".sha1($_POST['psw'])."' LIMIT 1;";
  $sth = $dbh->query($sql);
  $rowset = $sth->fetch(PDO::FETCH_ASSOC);

  session_start();
  if(count($rowset) > 1)
  {
    $_SESSION['user'] = $rowset;
  }
  else {
    $_SESSION['error'] = 1;
  }
  header('Location:index.php');
