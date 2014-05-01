

$(document).ready(function(){

  alert("hey hey");

  $("#form-route").hide();
  $("#create-route-button").append($("<button>").attr("id","route-formdrop").text("Create Route"));
  $("#route-formdrop").on('click', function(){
    $("#form-route").slideDown();
  });


  $("#route-trigger").on('click', function(event){
    event.preventDefault();
  });

  $.ajax({
    url: "/users/" + $("#user-id").val() + "/routes",
    method: "GET",
    dataType: "json"
  }).done(function(routes){
    var i = 1;
    $.each(routes, function(index, route){
      var route_id = '"route-' + i;
      var listItem = $("<li id=" + route_id + '">' + route.start_point + " to " + route.end_point + "</li>");
      $("#route-list").append(listItem);
      listItem.on("click", function(event){

        function getDirections(){
          return {
              origin: route.start_point,
              destination: route.end_point,
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

        var render = new google.maps.DirectionsRenderer();

        event.preventDefault();
        $("#directions").empty();
        renderDirections(render);
      });
      i++;
    });
  });

});

