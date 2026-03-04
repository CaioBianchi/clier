import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close(event) {
    if (event) {
      event.preventDefault()
    }
    
    // Clear the turbo frame
    const frame = this.element.closest("turbo-frame")
    frame.src = ""
    frame.innerHTML = ""
    
    // Update the URL back to /tools (or root) if it was a "show" URL
    const currentPath = window.location.pathname
    if (currentPath !== "/" && currentPath !== "/tools") {
      const search = window.location.search
      const targetPath = currentPath.startsWith("/tools") ? "/tools" : "/"
      window.history.pushState({}, "", targetPath + search)
    }
  }

  // Close on Escape key
  escClose(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }

  // Close when clicking the backdrop
  backdropClick(event) {
    if (event.target === event.currentTarget) {
      this.close()
    }
  }
}
