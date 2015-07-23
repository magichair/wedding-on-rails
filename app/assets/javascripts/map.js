(function(){
function wpgmappity_maps_loaded() {
var latlng = new google.maps.LatLng(55.948849,-3.2081126);
var styles = [
  {
    "featureType": "poi",
    "stylers": [{ "visibility": "off" }]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [{ "visibility": "off" }]
}]
var options = {
 center : latlng,
 mapTypeId: google.maps.MapTypeId.ROADMAP,
 zoomControl : true,
 zoomControlOptions :
 {
 style: google.maps.ZoomControlStyle.SMALL,
 position: google.maps.ControlPosition.TOP_LEFT
 },
 mapTypeControl : false,
 scaleControl : false,
 streetViewControl : false,
 panControl : false, zoom : 14,
 disableDefaultUI: true,
 styles: styles,
 scrollwheel: false,
};
var wpgmappitymap = new google.maps.Map(document.getElementById('wpgmappitymap'), options);
var point0 = new google.maps.LatLng(55.948849,-3.2081126);
var marker0= new google.maps.Marker({
 icon : 'http://labio-wedding.s3.amazonaws.com/assets/church7.png',
 position : point0,
 map : wpgmappitymap
 });
google.maps.event.addListener(marker0,'click',
 function() {
 var infowindow = new google.maps.InfoWindow(
 {content: '<h3 class="font-book-antiqua">The Ghullie Dhu</h3><a target=\"_blank\" href=\"http://www.ghillie-dhu.co.uk/\">Go to website</a>'});
 infowindow.open(wpgmappitymap,marker0);
 });
var point1 = new google.maps.LatLng(55.9457656,-3.2423226);
var marker1= new google.maps.Marker({
 icon : 'http://labio-wedding.s3.amazonaws.com/assets/hotel39.png',
 position : point1,
 map : wpgmappitymap
 });
google.maps.event.addListener(marker1,'click',
 function() {
 var infowindow = new google.maps.InfoWindow(
 {content: '<h3 class="font-book-antiqua">The Murrayfield Hotel</h3><a target=\"_blank\" href=\"http://www.themurrayfieldhotel.com/\">Go to website</a>'});
 infowindow.open(wpgmappitymap,marker1);
 });
var point2 = new google.maps.LatLng(55.946081,-3.218328);
var marker2= new google.maps.Marker({
 icon : 'http://labio-wedding.s3.amazonaws.com/assets/hotel39.png',
 position : point2,
 map : wpgmappitymap
 });
google.maps.event.addListener(marker2,'click',
 function() {
 var infowindow = new google.maps.InfoWindow(
 {content: '<h3 class="font-book-antiqua">Tune Hotel Haymarket </h3><a target=\"_blank\" href=\"http://tunehotels.com/\">Go to website</a>'});
 infowindow.open(wpgmappitymap,marker2);
 });
var point3 = new google.maps.LatLng(55.9509735,-3.2040625);
var marker3= new google.maps.Marker({
 icon : 'http://labio-wedding.s3.amazonaws.com/assets/hotel39.png',
 position : point3,
 map : wpgmappitymap
 });
google.maps.event.addListener(marker3,'click',
 function() {
 var infowindow = new google.maps.InfoWindow(
 {content: '<h3 class="font-book-antiqua">Premier Inn</h3><a target=\"_blank\" href=\"http://www.premierinn.com\">Go to website</a>'});
 infowindow.open(wpgmappitymap,marker3);
 });
}
window.onload = function() {
 wpgmappity_maps_loaded();
};
})()
