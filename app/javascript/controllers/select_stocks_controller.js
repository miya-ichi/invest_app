import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="select-stocks"
export default class extends Controller {
  static targets = ["selectBox"];

  connect() {
    const config = {};
    new TomSelect(this.selectBoxTarget, config);
  }
}
