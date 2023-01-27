import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-without-reload"
export default class extends Controller {
  static targets = ["likeButton", "likesNumber"]

  connect() {
    this.likes = parseInt(this.likesNumberTarget.innerText.split(" ")[0])
    this.csrfToken = document.querySelector('meta[name= "csrf-token"]').getAttribute('content')
    this.i = 0
    this.j = 0
    this.runTimerLike = () => {
      this.timerLike = window.setTimeout(
        () => {
          if (this.i % 2 == 1) {
            fetch(this.likeButtonTarget.parentNode.action,
              {method: "POST",
              headers: {"Accept": "text/html", "X-CSRF-Token": this.csrfToken},
              body: new FormData(this.likeButtonTarget.parentNod)
              })
          }
        }, 1000);
    }
    this.timerUnLike = 0
    this.runTimerUnLike = () => {
      this.timerUnLike = window.setTimeout(
        () => {
          if (this.j % 2 == 1) {
            fetch(this.likeButtonTarget.parentNode.action,
              {method: "POST",
              headers: {"Accept": "text/html", "X-CSRF-Token": this.csrfToken},
              body: new FormData(this.likeButtonTarget.parentNod)
              })
          }
        }, 1000);
    }
  }

  like(event) {
    event.preventDefault()
    clearTimeout(this.timerLike)
    this.i += 1
    this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-solid")
    this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-regular")
    this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("liked-heart")
    this.likes = this.i % 2 == 1 ? this.likes + 1 : this.likes - 1
    this.likesNumberTarget.innerText = `${this.likes} ${this.likes == 1 ? 'like' : 'likes'}`
    this.runTimerLike()
  }


  unlike(event) {
    event.preventDefault()
    clearTimeout(this.timerUnLike)
    this.j += 1
    this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-solid")
    this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("fa-regular")
    this.likeButtonTarget.getElementsByClassName("fa-heart")[0].classList.toggle("liked-heart")
    this.likes = this.j % 2 == 1 ? this.likes - 1 : this.likes + 1
    this.likesNumberTarget.innerText = `${this.likes} ${this.likes == 1 ? 'like' : 'likes'}`
    this.runTimerUnLike()
  }
}
