$(document).ready(function(){

  $("#tips-locking").on('click', function(){
      var lock = $("<div>").attr("id","locking-1");
      $("#tips").append(lock);

  });

  $("#tips-riding").on('click', function(){
    alert("Tips!");
  });

  $("#tips-safety").on('click', function(){
    alert("Tips!");
  });

});
