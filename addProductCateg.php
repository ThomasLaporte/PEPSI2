<?php
  include 'Class/Functions.php';
  require_once 'header.php';

    $lstFunctions = new Functions();

    $lstLanguages = $lstFunctions->getLanguages();
    $isComplete = true;
    if(isset($_POST['SubmitBtn'])) // si il existe et n'est pas vide
    {

      foreach ($lstLanguages as $language) {
          if(!isset($_POST['categName'.$language['idlanguage']])){
            $isComplete = false;
          }
      }

      if($isComplete == true){
        $codeValue = intval($lstFunctions->getMaxCodeFromCategProd()['MAX(code)']) +1;

        foreach ($lstLanguages as $language) {
            $lstFunctions->addArticleCategorie($_POST['categName'.$language['idlanguage']], $codeValue, $language['idlanguage']);
        }

      }
    }





    $content = "<h2>Ajout d'une nouvelle catégorie</h2>";
    $content .= "<form method=\"post\">";

    foreach ($lstLanguages as $language) {
        $content .= $language['name']." name of the new category: <input type=\"text\" name=\"categName".$language['idlanguage']."\"><br><br>";
        $content .= "Description: <textarea rows=\"4\" cols=\"50\" name=\"productDesc\"></textarea><br>";
    }


  //  $content .= "Nom de la catégorie: <input type=\"text\" name=\"categName\"><br>";

    // $content .= "Langue de la catégorie: <select name=\"languageCateg\" id=\"languageCateg\">";
    // foreach ($lstFunctions->getLanguages() as $language) {
    //   $content .= "<option value=\"".$language['idlanguage']."\">".$language['name']."</option>";
    // }
    //
    // $content .= "</select></br>";

    $content .= "<input type=\"submit\" value=\"Submit\" name=\"SubmitBtn\">";
    $content .= "</form>";
    echo $content;

    ?>

  </body>
  </html>




<!-- // $name= $_POST['name'];
//
// if (isset($name)){
//   require_once '/Class/Functions.php';
//   $lstFunctions = new Functions();
//
//   $lstFunctions->addArticleCategorie($name);
// }




if(isset($_GET['categName'])){

  $lstFunctions = new Functions();

  $lstFunctions->addArticleCategorie($_GET['categName']);

}
header('Location:http://127.0.0.1/pepsi2-backoffice/addProduct.php'); -->
