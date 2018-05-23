function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var reservationLocation = document.getElementById('reservation_location');

    if (reservationLocation) {
      var autocomplete = new google.maps.places.Autocomplete(reservationLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(reservationLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
