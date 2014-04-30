function getDirections(){
  return {
      origin: $("#directions-origin").val(),
      destination: $("#directions-destination").val(),
      provideRouteAlternatives: false,
      travelMode: google.maps.TravelMode.BICYCLING,
      unitSystem: google.maps.UnitSystem.IMPERIAL
    };
};

function renderDirections(){

    direction.route(getDirections(), function(response){
      render = new google.maps.DirectionsRenderer();
      render.setMap(map);
      render.setPanel(document.getElementById("directions"));
      render.setDirections(response)
    });
};

$(document).ready(function(){
  $("#directions-trigger").on('click', function(event){
    event.preventDefault();
    $("#directions").empty();
    renderDirections();
  });
});

