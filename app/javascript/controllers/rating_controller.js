import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  static targets = ["star", "input"]

  connect() {
    this.currentRating = this.inputTarget.value || 0
    if (this.currentRating > 0) {
      this.highlight(this.currentRating)
    }
  }

  hover(event) {
    const value = event.currentTarget.dataset.value
    this.highlight(value)
  }

  leave() {
    this.highlight(this.currentRating)
  }

  select(event) {
    this.currentRating = event.currentTarget.dataset.value
    this.inputTarget.value = this.currentRating
    this.highlight(this.currentRating)
  }

  highlight(value) {
    this.starTargets.forEach(star => {
      const svg = star.querySelector('svg')
      if (parseInt(star.dataset.value) <= parseInt(value)) {
        svg.classList.add("text-yellow-400")
        svg.classList.remove("text-gray-300", "dark:text-gray-600")
      } else {
        svg.classList.remove("text-yellow-400")
        svg.classList.add("text-gray-300", "dark:text-gray-600")
      }
    })
  }
}
