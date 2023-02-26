import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form", "nolessons","ritems", "rform", "noreviews"]

  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
    // console.log(this.ritemsTarget)
    // console.log(this.rformTarget)
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item);
          if (this.hasNolessonsTarget) {
            this.nolessonsTarget.style = 'display: none;';
          }
        }
        console.log(data.form);
        this.formTarget.outerHTML = data.form
      })

  }

  rsend(event) {
      event.preventDefault()

      fetch(this.rformTarget.action, {
        method: "POST",
        headers: { "Accept": "application/json" },
        body: new FormData(this.rformTarget)
      })
        .then(response => response.json())
        .then((data) => {
          if (data.inserted_item) {
            this.ritemsTarget.insertAdjacentHTML("afterbegin", data.inserted_item);
            this.noreviewsTarget.style = 'display: none;';

          }
          this.rformTarget.outerHTML = data.form
        })
  }
}
