<?php

class DbConnection {
    private $dsn = 'mysql:dbname=PEPSI2;host=127.0.0.1';
    private  $user = 'root';
    private  $password = '';
    private $dbh = false;

    function __construct() {

    }

    public function dbConect(){
      if ( ! $this->dbh ){
        try {
          $this->dbh = new PDO($this->dsn, $this->user, $this->password);
        } catch (PDOException $e) {
          die('Connexion échouée : ' . $e->getMessage());
        }
      }
    }

    public function query($stat, $arg = false)
    {
        if (!$this->dbh) {
            $this->dbConect();
        }
        if ($arg) {
            if (!is_array($arg)) {
                $arg = array($arg);
            }
            $req = $this->dbh->prepare($stat);
            $req->execute($arg);
        } else {
            $req = $this->dbh->query($stat);
        }
        return $req;
    }

}
