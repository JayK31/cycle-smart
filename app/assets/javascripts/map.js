var direction = new google.maps.DirectionsService();
var map;

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
  map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);

  var contentHomeMarker = '<div id="home-marker">' +
  '<h4>You are here!</h4>' +
  '</div>';

  var infowindow = new google.maps.InfoWindow({
      content: contentHomeMarker
  });

  // sets a marker on the map for the user's current location
  var marker = new google.maps.Marker({
    position: currentLocation,
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
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
        draggable: false,
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
        draggable: false,
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

      var contentShopMarker = '<div id="shop-marker">' +
      '<div id="shop-marker-name">' +
      '<h4>' + shop["name"] + '</h4>' +
      '</div>' +
      '<div id="shop-marker-address">' +
      '<p>' + shop["formatted_address"] + '</p>' +
      '</div>' +
      '<div id="shop-marker-info">' +
      '<p>' + '<strong>Open: </strong>' + shop["opening_hours"]["open_now"] +
      '<strong> Rating: </strong>' + shop["rating"] + '</p>' +
      '</div>' +
      '</div>';

      var infowindow = new google.maps.InfoWindow({
        content: contentShopMarker
      });

      var shop_marker = new google.maps.Marker({
        position: shop_location,
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        icon: shop["icon"]
      });

      google.maps.event.addListener(shop_marker, 'click', function() {
        infowindow.open(map,shop_marker);
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
