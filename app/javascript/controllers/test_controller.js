import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log("I'm connnnnnnnnnnnnnected")
    console.log(this.element)
    console.log(this.formTarget)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
    console.log(this.formTarget.action)
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    console.log("token")
    console.log("token", this.csrfToken)
  }

  send(event) {
    event.preventDefault()
    console.log(this.csrfToken)
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "application/json", "X-CSRF-Token": this.csrfToken},
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log("1st Task")
        console.log(data)
        console.log("2nd Task")
        if (data.inserted_item) {
          // console.log(this.itemsTarget)
          this.itemsTarget.insertAdjacentHTML("afterbegin", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
