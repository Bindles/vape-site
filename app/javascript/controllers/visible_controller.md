import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visible"
export default class extends Controller {
  static values = {
    // on: Boolean,
    // list: Array,
    // age: Number,
    // car: Object,
    visible: Boolean
  }
  connect() {
    console.log("ja")
    this.updateVisibility();
  }

  VisibileValueChanged(prev, curr) {
    console.log(prev)
    console.log(curr);
    this.updateVisibility();

  }

  updateVisibility() {
    if (this.visibleValue){
      this.element.style.display = "block"
    } else {
      this.element.style.display = "none" 
    }
  }
}