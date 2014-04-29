
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

  $.ajax({
    url: "/traffic_incidents",
    method: "GET",
    dataType: "json"
  }).done(function(incidents) {
    // fixed each method to include index
    $.each(incidents, function(index, incident){
      // debugger;
      var incident_location = new google.maps.LatLng(Number(incident.latitude), Number(incident.longitude));
      // debugger;
      var incident_marker = new google.maps.Marker({
        position: incident_location,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP
        });
      // set incident market on the map
      incident_marker.setMap(map);
    });
  });

  $.ajax({
    url: "/station",
    method: "GET",
    dataType: "json"
  }).done(function(stations) {
    $.each(stations, function(index, station) {
      var station_location = new google.maps.LatLng(Number(station["latitude"]), Number(station["longitude"]));
     var station_marker = new google.maps.Marker({
        position: station_location,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        icon: '/assets/citibike.jpeg'
     });
     station_marker.setMap(map);
    });
  });

  $.ajax({
    url: "/shop",
    method: "GET",
    dataType: "json"
  }).done(function(shops) {
    $.each(shops, function(index, shop) {
      var shop_location = new google.maps.LatLng(
        Number(shop["geometry"]["location"]["lat"]), Number(shop["geometry"]["location"]["lng"]));
      var shop_marker = new google.maps.Marker({
        position: shop_location,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        icon: shop["icon"]
      });
      shop_marker.setMap(map)
    });
  });

}


$(document).ready(function(){
// getting user location with HTML5 Geolocation location
// passing it the name of a function - 'initialize'
  navigator.geolocation.getCurrentPosition(initialize);
});
