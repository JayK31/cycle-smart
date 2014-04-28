
// 'initialize' function gets passed 'location' object which contains user location info
function initialize(location){
  console.log(location);
  // setting user latitude & longitude to currentLocation variable
  var currentLocation = new google.maps.LatLng(location.coords.latitude, location.coords.longitude);

  // settings for the map display
  var mapOptions = {
  center: currentLocation,
  zoom: 15
  };

  // map variable pointing to the "map-canvas" div in the HTML
  var map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);

  // sets a marker on the map for the user's current location
  var marker = new google.maps.Marker({
    position: currentLocation,
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP
  });

}


$(document).ready(function(){
// getting user location with HTML5 Geolocation location
// passing it the name of a function - 'initialize'
  navigator.geolocation.getCurrentPosition(initialize);
});
