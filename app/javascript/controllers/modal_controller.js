import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
    console.log("Connected modal controller");
    setTimeout(() => {
      this.sidebarTarget.classList.remove('translate-x-full')
      this.sidebarTarget.classList.add('translate-x-0')
    }, 50)

    this.element.addEventListener("turbo:submit-end", (event) => {
      console.log(event)
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url)
      }
    })
  }

  close() {
    this.sidebarTarget.classList.remove('translate-x-0')
    this.sidebarTarget.classList.add('translate-x-full')

    setTimeout(() => {
      this.element.parentElement.removeAttribute("src")
      this.element.remove()
    }, 250)
  }
}
