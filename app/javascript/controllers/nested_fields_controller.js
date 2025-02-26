import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="nested-fields"
export default class extends Controller {
    static targets = ["minStock", "error"];

    toggleMinStock(event) {
        if (event.target.checked) {
            this.minStockTarget.classList.remove("hidden");
        } else {
            this.minStockTarget.classList.add("hidden");
        }
    }

    connect() {
        setTimeout(() => {
            this.errorTarget.classList.add("hidden");
        }, 3000);
    }
}
