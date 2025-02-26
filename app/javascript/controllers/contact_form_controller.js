import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="contact-form"
export default class extends Controller {
  static targets = ["error"];

  connect() {
    setTimeout(() => {
        this.errorTarget.classList.add("hidden");
    }, 3000);
  }
}
