<?php include "../Class/Functions.php";
    require_once "../header.html";


  $content = "";
  $lstFunctions = new Functions();

  if(isset($_POST['addLanguage']) && strlen($_POST['addLanguage']) > 0) // si il existe et n'est pas vide
  {
      $lstFunctions->addLanguage($_POST['addLanguage']);
      unset($_POST['addLanguage']);
  }

  $content .= "<br><h3>List of languages</h3>";
  $content .=  "<table>";

  $content .=  "<tr>";
    $content .=  "<th>Language title</th>";
  $content .=  "</tr>";


  // Le parametre correspond a la langue : par defaut Francais (id 1)
  foreach ($lstFunctions->getLanguages() as $language) {
    $content .= "<tr>";
      $content .= "<td><a href=\"deleteLanguage.php?lang=".$language['idlanguage']."\">-</a></td>";
      $content .= "<td>". $language['name']."</td>";
    $content .= "</tr>";
  }
  $content .=  "</table>";
  $content .= "<form method=\"post\">";
  $content .= "<input name=\"addLanguage\" id=\"addLanguage\" type=\"text\">  <input type=\"submit\" value=\"Ajouter langue\" name=\"btnAddLanguage\">";

  $content .= "</form>";


  echo $content;
  ?>


</body>
</html>
