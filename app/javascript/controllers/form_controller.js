import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["input", "output"];

  resize() {
    this.outputTarget.textContent = this.inputTarget.value + '\u200b';
  }
}
