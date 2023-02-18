import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" ]

  connect() {
    console.log("hello")
    flatpickr(this.startDateTarget, {enableTime: false, dateFormat: "Y-m-d"})
    flatpickr(this.endDateTarget, {enableTime: false, dateFormat: "Y-m-d"})
  }
}
