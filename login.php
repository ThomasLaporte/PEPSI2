<?php
  include('bddConnection.php');
  // $sql = "SELECT * FROM PEPSI2.users WHERE login='".$_POST['login']."' AND password='".sha1($_POST['psw'])."' LIMIT 1;";
  // $sth = $dbh->query($sql);
  // $rowset = $sth->fetch(PDO::FETCH_ASSOC);


  $sql = "SELECT * FROM PEPSI2.users WHERE login = :login AND password = :pswd LIMIT 1;";
  $sth = $dbh->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
  $sth->execute(array(':login' => $_POST['login'], ':pswd' => sha1($_POST['psw'])));
  $rowset = $sth->fetch();

    session_start();
    if(count($rowset) > 1)
    {
      $_SESSION['user'] = $rowset;
    }
    else {
      $_SESSION['error'] = 1;
    }
    header('Location:index.php');
