<?php

$title_page = 'Spectasonic - Où acheter';
include 'header.php';

?>
<div class="wrap">

<h1 class="wow fadeIn">Où acheter</h1>

<section class="catalogue_products wow fadeInUp">
    <article class="catalogue_products_title">
        <h2>Liste des revendeurs</h2>
        <p>Vous trouverez ici une liste des revendeurs agrées, regroupés sur une carte.</p>
    </article>
    <div class="map_products_wrap">
      <div id="map" style="width: 500px; height: 400px;"></div>
    </div>
</section>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDMttl2DKMaqbRmQcuQtbOT00bPmq9fzY" type="text/javascript"></script>

<script type="text/javascript">
var locations=[];

$.ajax({
          url: '../Article/location.php',
          type: 'POST',
          async: true,
          data: 'type=detail',
          dataType: 'json',
          success: function (json) {

              $.each(json, function (index, value) {
                      locations.push([json[index][0], json[index][1], json[index][2]],index)
              });

               var map = new google.maps.Map(document.getElementById('map'), {
                 zoom: 5,
                 center: new google.maps.LatLng(46.763062, 2.424724),
                 mapTypeId: google.maps.MapTypeId.ROADMAP
               });

               var infowindow = new google.maps.InfoWindow();

               var marker, i;

               for (i = 0; i < locations.length; i++) {
                 marker = new google.maps.Marker({
                   position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                   map: map
                 });

                 google.maps.event.addListener(marker, 'click', (function(marker, i) {
                   return function() {
                     infowindow.setContent(locations[i][0]);
                     infowindow.open(map, marker);
                   }
                 })(marker, i));
               }

          },
          error: function(error) {
            console.log('erreur : ', error);
          }
});

</script>


<?php

include 'footer.php';

?>
