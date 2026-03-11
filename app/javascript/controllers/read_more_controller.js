import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "overlay", "buttonContainer"]
  static values = { maxHeight: { type: Number, default: 500 } }

  connect() {
    this.checkHeight()
    
    // Also observe images loading
    const images = this.contentTarget.querySelectorAll("img")
    images.forEach(img => {
      img.addEventListener("load", () => this.checkHeight())
    })
  }
  
  checkHeight() {
    // Only apply if we haven't expanded yet
    if (this.expanded) return
    
    if (this.contentTarget.scrollHeight > this.maxHeightValue + 150) {
      this.contentTarget.style.maxHeight = `${this.maxHeightValue}px`
      this.contentTarget.style.overflow = "hidden"
      this.overlayTarget.classList.remove("hidden")
      
      this.buttonContainerTarget.classList.remove("hidden")
      this.buttonContainerTarget.classList.add("flex")
    }
  }

  expand() {
    this.expanded = true
    this.contentTarget.style.maxHeight = "none"
    this.contentTarget.style.overflow = "visible"
    this.overlayTarget.classList.add("hidden")
    
    this.buttonContainerTarget.classList.add("hidden")
    this.buttonContainerTarget.classList.remove("flex")
  }
}