


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
    $.each(routes, function(index, route){
      $("#route-list").append("<li>" + route.start_point + " to " + route.end_point + "</li>");
    });
  });

});

