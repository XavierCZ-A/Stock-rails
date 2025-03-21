// app/javascript/controllers/nested_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template", "associations"]

    connect() {
        this.wrapperClass = this.data.get("wrapperClass") || "nested-fields"
        this.indexAttributeName = this.data.get("indexAttributeName") || "data-index"
    }

    addAssociation(event) {
        event.preventDefault()

        const content = this.templateTarget.innerHTML.replace(/__TEMPLATE_INDEX__/g, new Date().getTime())
        this.associationsTarget.insertAdjacentHTML('beforeend', content)
    }

    removeAssociation(event) {
        event.preventDefault()

        const wrapper = event.target.closest(".products-row")

        // Check if there's a hidden _destroy field
        const destroyField = wrapper.querySelector("input[name*='_destroy']")

        if (destroyField) {
            // If we have a destroy field, set it to '1' instead of removing the wrapper
            destroyField.value = "1"
            wrapper.style.display = 'none'
        } else {
            // If no destroy field, simply remove the wrapper
            wrapper.remove()
        }

        // Update the total
        const orderController = this.application.getControllerForElementAndIdentifier(
            document.querySelector("[data-controller='order']"),
            "order"
        )
        if (orderController) {
            orderController.updateGrandTotal()
        }
    }
}