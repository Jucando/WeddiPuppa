import flatpickr from 'flatpickr'
import 'flatpickr/dist/themes/airbnb.css'

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true,
  minDate: "today"
});
