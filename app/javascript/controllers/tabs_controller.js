import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["created", "joined", "createdLink", "joinedLink"]
  connect() {
    console.log(this.createdTarget)
    this.displayJoined()
  }

  displayCreated() {
    this.createdTarget.classList.remove("d-none")
    this.joinedTarget.classList.add("d-none")

    this.createdLinkTarget.classList.add("active")
    this.joinedLinkTarget.classList.remove("active")
  }

  displayJoined() {
    this.joinedTarget.classList.remove("d-none")
    this.createdTarget.classList.add("d-none")

    this.joinedLinkTarget.classList.add("active")
    this.createdLinkTarget.classList.remove("active")
  }
}
