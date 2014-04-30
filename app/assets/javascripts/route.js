


$(document).ready(function(){

  $("#form-route").hide();
  $("#create-route-button").append($("<button>").attr("id","route-formdrop").text("Create Route"));
  $("#route-formdrop").on('click', function(){
    $("#form-route").slideDown();
  });


  $("#route-trigger").on('click', function(event){
    event.preventDefault();
  });
});

