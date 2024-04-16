import { Controller } from "@hotwired/stimulus"
import { useIntersection, useResize } from 'stimulus-use'

export default class extends Controller {
  connect() {
    useIntersection(this)
    useResize(this)
    console.log("YEP")
    console.log(this)
  }

  appear(entry) {
    // triggered when the element appears within the viewport
  }

  resize({ height, width }) {
    // trigered when the element is resized
    console.log(width)
    document.getElementById("showMessage").innerHTML = width
  }
}
