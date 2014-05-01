

$(document).ready(function(){



  $("#form-route").hide();
  $("#create-route-button").append($("<button>").attr("id","route-formdrop").text("Create Route"));
  $("#route-formdrop").on('click', function(){
    $("#form-route").slideDown();
  });

    $("#routes").hide();

  $("#create-route-button").on('click', function(event){
      event.preventDefault();
    $("#routes").slideDown();
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


  // $("#routes").hide();
  // $("#routestext").on("mouseover", function(){
  //   $("#routes").slideDown();

  // });





  // $("#create-route-button").mouseover(function(){
  //   $("#route-formdrop").css("text-shadow", "0px 1px 1px #4d4d4d");
  //   $("#route-formdrop").css("color","#222");

  // });

  // $("#create-route-button").mouseleave(function(){
  //   $("#route-formdrop").css("color", "red");
  // });


});

