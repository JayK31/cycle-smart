

$(document).ready(function(){

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
      listItem.on("click", function(){
        // New Google Maps Directions call
        // var render = new google.maps.DirectionsRenderer();
        var callback = function() {
          origin = route.start_point;
          destination = route.end_point;
          return getDirections(origin, destination);
        }

        renderDirections(render, callback)
      });
      i++;
    });
  });

});

