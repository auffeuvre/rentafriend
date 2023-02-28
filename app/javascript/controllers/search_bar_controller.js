import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ['results', 'input']

  connect() {
    console.log('toto')
  }

  autocomplete(e) {
    this.resultsTarget.innerHTML = "";

    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${e.target.value}.json?access_token=pk.eyJ1IjoibW9iYmlnIiwiYSI6ImNsZHlrZG9pZDBkcmIzb253eHVidWE3YncifQ.iTE26jQdr5mmS8qu9XyLfQ`)
    .then(response => response.json())
    .then((data) => {
      data.features.forEach(element => {
        this.resultsTarget.insertAdjacentHTML('beforeend', `<li data-action="click->search-bar#fill">${element.place_name}</li>`);
      });

    });
  }

  fill(e) {
    this.inputTarget.value = e.target.innerText;
  }
}
