(function(){
function wpgmappity_maps_loaded() {
var latlng = new google.maps.LatLng(55.9483936,-3.2224041);
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
 zoomControl : false,
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
 icon : '/assets/venue.png',
 position : point0,
 map : wpgmappitymap
 });
var point1 = new google.maps.LatLng(55.9457656,-3.2423226);
var marker1= new google.maps.Marker({
 icon : '/assets/hotel.png',
 position : point1,
 map : wpgmappitymap
 });
var infowindow1 = new google.maps.InfoWindow(
 {content: '<br /><p style="margin-bottom: 0; padding-bottom: 10px">The Murrayfield Hotel<br /><a target=\"_blank\" href=\"http://www.themurrayfieldhotel.com/\">Book online</a></p>'
});
google.maps.event.addListener(marker1,'click',function() {
  infowindow1.open(wpgmappitymap,marker1);
});
var point2 = new google.maps.LatLng(55.946081,-3.218328);
var marker2= new google.maps.Marker({
 icon : '/assets/hotel.png',
 position : point2,
 map : wpgmappitymap
 });
 var infowindow2 = new google.maps.InfoWindow(
 {content: '<br /><p style="margin-bottom: 0; padding-bottom: 10px">Tune Hotel Haymarket<br /><a target=\"_blank\" href=\"http://tunehotels.com/\">Book online</a></p>'});
google.maps.event.addListener(marker2,'click',
function() {
  infowindow2.open(wpgmappitymap,marker2);
});
var point3 = new google.maps.LatLng(55.9509735,-3.2040625);
var marker3= new google.maps.Marker({
 icon : '/assets/hotel.png',
 position : point3,
 map : wpgmappitymap
 });
 var infowindow3 = new google.maps.InfoWindow(
 {content: '<br /><p style="margin-bottom: 0; padding-bottom: 10px">Premier Inn<br /><a target=\"_blank\" href=\"http://www.premierinn.com\">Book online</a>'});
google.maps.event.addListener(marker3,'click',
 function() {
 infowindow3.open(wpgmappitymap,marker3);
 });
}
window.onload = function() {
  if($("#wpgmappitymap").length > 0) {
    wpgmappity_maps_loaded();
  }
};
})()
