import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-on-click-radio-button"
export default class extends Controller {
  static targets = ["slot"]

  connect() {
    $(document).on("click", "[data-behavior=submit-on-click]", function() {
      $form = $(this).closest('form'); // select the form
      $form.submit(); // submit it
    });
  }
}
