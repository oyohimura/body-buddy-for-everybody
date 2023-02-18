import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate"]

  connect() {
    console.log("hello")
    flatpickr(this.startDateTarget, {enableTime: true, time_24hr: true, minuteIncrement: 5})
  }
}
