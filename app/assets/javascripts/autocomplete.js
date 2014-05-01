var autocompleteOrigin;
var autocompleteDestination;

$(document).ready(function(){
  var options = {
    componentRestrictions: {country: 'us'}
  }

  var inputOrigin = document.getElementById('directions-origin');
  var inputDestination = document.getElementById('directions-destination');

  autocompleteOrigin = new google.maps.places.Autocomplete(inputOrigin, options);
  autocompleteDestination = new google.maps.places.Autocomplete(inputDestination, options);

});

