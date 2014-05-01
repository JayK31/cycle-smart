

$(document).ready(function(){



  $("#form-route").hide();
  $("#create-route-button").append($("<button>").attr("id","route-formdrop").text("Create Route"));
  $("#route-formdrop").on('click', function(){
    $("#form-route").slideDown();
  });

  $("#route-trigger").on('click', function(event){
    $(preventDefault);

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


  // $("#create-route-button").mouseover(function(){
  //   $("#route-formdrop").css("text-shadow", "0px 1px 1px #4d4d4d");
  //   $("#route-formdrop").css("color","#222");

  // });

  // $("#create-route-button").mouseleave(function(){
  //   $("#route-formdrop").css("color", "red");
  // });


});

