// sorting_controller.js (Stimulus)
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"];

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  sortComponents(event) {
    event.preventDefault();

    const link = event.currentTarget;
    const sortBy = link.getAttribute("data-sort-by");
    const order = (link.getAttribute("data-order") === "asc") ? "desc" : "asc";

    const url = `/components?sort_by=${sortBy}&order=${order}`;

    this.doTurboRequest(url);
  }

  doTurboRequest(url) {
    fetch(url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      },
    })
      .then((response) => response.text())
      .then((html) => {
        Turbo.renderStreamMessage(html);
      });
  }

  update() {
    console.log("update");
  }
}
