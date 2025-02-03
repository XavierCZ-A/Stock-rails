import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
    alert("Hello, Stimulus!")
  }

  show(event) {
    const dialog = document.getElementById(event.params.dialog);
    console.log(event);
    dialog.showModal();
  }

  toggleMinStock(event) {
    if (event.target.checked) {
      this.minStockTarget.classList.remove("hidden");
    } else {
      this.minStockTarget.classList.add("hidden");
    }
  }
}
