import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = [ "name", "output" ]

  greet() {
    l("hi")
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
