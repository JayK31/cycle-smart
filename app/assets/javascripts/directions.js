function getDirections(){
  return {
      origin: autocompleteOrigin.getPlace().formatted_address,
      destination: autocompleteDestination.getPlace().formatted_address,
      provideRouteAlternatives: true,
      avoidHighways: true,
      travelMode: google.maps.TravelMode.BICYCLING,
      unitSystem: google.maps.UnitSystem.IMPERIAL
    };
}

function renderDirections(render){

    direction.route(getDirections(), function(response){
      console.log(response);
      render.setMap(map);
      render.setPanel(document.getElementById("directions"));
      render.setDirections(response)
    });
}

$(document).ready(function(){

  $("#form-directions").hide();
  $("#directions-button").append($("<button>").attr("id","directions-formdrop").text("Get Directions"));
  $("#directions-formdrop").on('click', function(){
    $("#form-directions").slideDown();
  });

  var render = new google.maps.DirectionsRenderer();


  $("#directions-trigger").on('click', function(event){
    event.preventDefault();
    $("#directions").empty();
    renderDirections(render);
  });
})
