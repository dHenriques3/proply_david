import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    markers: Array,
    apiKey: String
  }

  connect() {
    console.log(this.markersValue)

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitToMap()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Add markers to map
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker['lng'], marker['lat'] ])
        .addTo(this.map)
    })
  }

  #fitToMap() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1000 })
  }
}
