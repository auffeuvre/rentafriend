import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ['results', 'input']

  connect() {
    console.log('Connected to search bar')
  }

  autocomplete(e) {
    this.resultsTarget.innerHTML = "";

    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${e.target.value}.json?access_token=pk.eyJ1IjoibW9iYmlnIiwiYSI6ImNsZHlrZG9pZDBkcmIzb253eHVidWE3YncifQ.iTE26jQdr5mmS8qu9XyLfQ`)
    .then(response => response.json())
    .then((data) => {
      data.features.forEach(element => {
        this.resultsTarget.insertAdjacentHTML('beforeend', `<option data-action="click->search-bar#fill" value="${element.place_name}"></option>`);
      });

    });
  }

  fill(e) {
    this.inputTarget.value = e.target.innerText;
  }
}
