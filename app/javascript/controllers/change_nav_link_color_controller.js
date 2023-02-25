import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-nav-link-color"
export default class extends Controller {
  connect() {
    console.log("Hello from change nav link controller!");
  }

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      // this.element.classList.add("navbar-lewagon-white")
      // console.log("Changing navbar color!");
      this.element.classList.add("navbar-lewagon")
      this.element.classList.remove("navbar-lewagon-hp")
    } else {
      this.element.classList.remove("navbar-lewagon")
      this.element.classList.add("navbar-lewagon-hp")
    }
  }
}
