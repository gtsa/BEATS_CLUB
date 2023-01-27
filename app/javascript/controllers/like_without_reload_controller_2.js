import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-without-reload"
export default class extends Controller {
  static targets = ["likeButton", "likesNumber"]

  connect() {
    this.likes = parseInt(this.likesNumberTarget.innerText.split(" ")[0])
    this.csrfToken = document.querySelector('meta[name= "csrf-token"]').getAttribute('content')
    this.i = 1
    this.j = 1
  }

  like(event) {
    event.preventDefault()
    if (this.i % 2 == 1) {
      fetch(this.likeButtonTarget.parentNode.action.slice(0, -4).concat("like"),
        {method: "POST",
         headers: {"Accept": "text/html", "X-CSRF-Token": this.csrfToken},
         body: new FormData(this.likeButtonTarget.parentNod)
        })
        .then(
          (response) => {
            if (response.ok) {
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-solid"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-regular"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("liked-heart"),
              this.likes = this.likes + 1,
              this.i += 1,
              this.likesNumberTarget.innerText = `${this.likes} ${this.likes == 1 ? 'like' : 'likes'}`
            }
          }
        )
    } else {
      fetch(this.likeButtonTarget.parentNode.action.slice(0, -4).concat("unlike"),
        {method: "POST",
         headers: {"Accept": "text/html", "X-CSRF-Token": this.csrfToken},
         body: new FormData(this.likeButtonTarget.parentNod)
        })
        .then(
          (response) => {
            if (response.ok) {
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-solid"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-regular"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("liked-heart"),
              this.likes = this.likes - 1,
              this.i += 1,
              this.likesNumberTarget.innerText = `${this.likes} ${this.likes == 1 ? 'like' : 'likes'}`
            }
          }
        )
    }
  }

  unlike(event) {
    event.preventDefault()
    if (this.j % 2 == 1) {
      fetch(this.likeButtonTarget.parentNode.action.slice(0, -6).concat("unlike"),
        {method: "POST",
         headers: {"Accept": "text/html", "X-CSRF-Token": this.csrfToken},
         body: new FormData(this.likeButtonTarget.parentNod)
        })
        .then(
          (response) => {
            if (response.ok) {
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-solid"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-regular"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("liked-heart"),
              this.likes = this.likes - 1,
              this.j += 1,
              this.likesNumberTarget.innerText = `${this.likes} ${this.likes == 1 ? 'like' : 'likes'}`
            }
          }
        )
    } else {
      fetch(this.likeButtonTarget.parentNode.action.slice(0, -6).concat("like"),
        {method: "POST",
         headers: {"Accept": "text/html", "X-CSRF-Token": this.csrfToken},
         body: new FormData(this.likeButtonTarget.parentNod)
        }).
        then(
          (response) => {
            if (response.ok) {
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-solid"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-regular"),
              this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("liked-heart"),
              this.likes = this.likes + 1,
              this.j += 1,
              this.likesNumberTarget.innerText = `${this.likes} ${this.likes == 1 ? 'like' : 'likes'}`
            }
          }
        )
      }
  }
}
