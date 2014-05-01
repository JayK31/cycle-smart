$(document).ready(function(){

  $("locking-1").hide;

  $("#tips-locking").on('click', function(){

      $("locking-1").show();

  });

  $("#tips-riding").on('click', function(){
    alert("Tips!");
  });

  $("#tips-safety").on('click', function(){
    alert("Tips!");
  });

});
