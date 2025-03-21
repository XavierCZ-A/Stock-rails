import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["sizes"];

    connect() {
        console.log("Product controller connected");
    }
    toggleMinStock(event) {
        if (event.target.checked) {
            this.sizesTarget.classList.remove("hidden");
        } else {
            this.sizesTarget.classList.add("hidden");
        }
    }
}
