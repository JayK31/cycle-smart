function getDirections(){
  return {
      // Will use commented out origin/destination when form/event
      //listener is built, hardcoding for now.
      origin: $("#directions-origin").val(),
      destination: $("#directions-destination").val(),
      // origin: " 61 Wythe Ave, Brooklyn, NY 11249",
      // destination: "10 E. 21st St., New York, NY",
      provideRouteAlternatives: false,
      travelMode: google.maps.TravelMode.BICYCLING,
      unitSystem: google.maps.UnitSystem.IMPERIAL
    };
};

function renderDirections(){

    console.log("HELLO FROM INSIDE THE FUNCTION")

    direction.route(getDirections(), function(response){
      console.log(response);
      render = new google.maps.DirectionsRenderer();
      render.setMap(map);
      render.setPanel(document.getElementById("directions"));
      render.setDirections(response)
    });
};

$(document).ready(function(){
  $("#directions-trigger").on('click', function(event){
    event.preventDefault();
    renderDirections();
  });
});

