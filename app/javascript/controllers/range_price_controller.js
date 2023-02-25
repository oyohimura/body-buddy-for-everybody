import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "display", "input" ];

  connect() {
    console.log("Hello from connect");
  
  }

  displayPrice(event) {
    const input = event.currentTarget;
    const value = input.value;
    console.log("Value: ", value);
    this.displayTarget.innerText = value + "€";
  }
}
