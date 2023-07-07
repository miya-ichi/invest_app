import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="select-stocks"
export default class extends Controller {
  static targets = ["selectBox"];

  connect() {
    const config = {
      valueField: 'id',
      labelField: 'name',
      searchField: 'name',
      selectOnTab: true,
      load: (query, callback) => {
        var url = this.selectBoxTarget.dataset.urlValue + '.json?q=' + encodeURIComponent(query);
        fetch(url)
          .then(response => response.json())
          .then(json => {
            callback(json);
          }).catch(() => {
            callback();
          });
      }
    };
    new TomSelect(this.selectBoxTarget, config);
  }
}
