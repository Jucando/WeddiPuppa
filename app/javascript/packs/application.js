import "bootstrap";
import "../plugins/flatpickr";
import "../plugins/carousel";


// Photo upload handle event
function photoupload() {
  $(document).ready( function() {
    $(document).on('change', ':file', function() {
      document.querySelector(".box-select").innerHTML = "<i class='fas fa-check'></i>&nbsp Loaded";
      document.querySelector(".box-select").classList.add('box-select-filled');
    });
  });
}

photoupload();
