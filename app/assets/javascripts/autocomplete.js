var autocompleteOrigin;
var autocompleteDestination;

$(document).ready(function(){
  var options = {
    // bounds: defaultBounds,
    componentRestrictions: {country: 'us'}
  }

  var inputOrigin = document.getElementById('directions-origin');
  var inputDestination = document.getElementById('directions-destination');

  // maps.controls[google.maps.ControlPosition.TOP_LEFT].push(inputOrigin);
  // maps.controls[google.maps.ControlPosition.TOP_LEFT].push(inputDestination);

  autocompleteOrigin = new google.maps.places.Autocomplete(inputOrigin, options);
  autocompleteDestination = new google.maps.places.Autocomplete(inputDestination, options);

});

