<?php
include('bddConnection.php');

function getProducts()
{
   $sql = "SELECT * FROM products;";
   $sth = $dbh->query($sql);
   $rowset = $sth->fetchAll(PDO::FETCH_ASSOC);
}
