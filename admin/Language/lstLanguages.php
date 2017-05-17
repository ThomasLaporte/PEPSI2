<?php
  include "../../Class/Functions.php";
  $title_page = 'Spectasonic - Catalogue Backoffice';
  require_once "../../header.php";

  $lstFunctions = new Functions();

  if(isset($_POST['addLanguage']) && strlen($_POST['addLanguage']) > 0) // si il existe et n'est pas vide
  {
      $lstFunctions->addLanguage($_POST['addLanguage']);
      unset($_POST['addLanguage']);
  }
?>
  <h1>Liste des langages</h1>
  <table>
    <tr>
      <th></th>
      <th>Langues</th>
    </tr>

    <?php
      foreach ($lstFunctions->getLanguages() as $language) { ?>
        <tr>
          <td><a href="deleteLanguage.php?lang=<?php echo $language['id_language'];?>"> X </a></td>
          <td><?php echo $language['name'];?></td>
        </tr><?php
      }?>
  </table>
  <form method="post">
    <input name="addLanguage" id="addLanguage" type="text">  <input type="submit" value="Ajouter langue" name="btnAddLanguage">
  </form>

<?php
  include '../../footer.php';
