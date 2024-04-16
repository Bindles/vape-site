import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visible"
export default class extends Controller {
  static values = {

    visible: Boolean,
  }

  connect() {
    console.log("ja")
    this.updateVisibility();
  }

  visibleValueChanged() {
    console.log("update")
    this.updateVisibility();
  }

  updateVisibility() {
    if (this.visibleValue==true){
      this.element.style.display = "block";
    } else {
      this.element.style.display = "none"; 
    }
  }

}