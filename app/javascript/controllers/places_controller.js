import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "field", "map", "latitude", "longitude", "postal_code", "state", "city", "address1", "address2" ]

  connect() {
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(39.5, -98.35),
      zoom: 4
    })

    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
    this.autocomplete.bindTo('bounds', this.map)
    this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
    this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

    this.marker = new google.maps.Marker({
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29)
    })
  }

  placeChanged() {
    let place = this.autocomplete.getPlace()

    if(!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return
    }

    if(place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport)
    } else {
      this.map.setCenter(place.geometry.location)
      this.map.setZoom(17)
    }

    this.marker.setPosition(place.geometry.location)
    this.marker.setVisible(true)
    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
    this.postal_codeTarget.value = place.address_components.find(e => e.types[0].includes("postal_code")).short_name
    this.stateTarget.value = place.address_components.find(e => e.types[0].includes("administrative_area_level_1")).short_name
    this.cityTarget.value = place.address_components.find(e => e.types[0].includes("locality")).short_name
    let street_number = place.address_components.find(e => e.types[0].includes("street_number")).short_name
    let route = place.address_components.find(e => e.types[0].includes("route")).short_name
    this.address1Target.value = `${street_number} ${route}`
  }
}


// [{long_name: "1101", short_name: "1101", types: ["street_number"]}, 
// {long_name: "East Montgomery Cross Road", short_name: "E Montgomery Cross Rd", types: ["route"]}, 
// {long_name: "Lundhurst/Rivers End", short_name: "Lundhurst/Rivers End", types: ["neighborhood", "political"]}, 
// {long_name: "Savannah", short_name: "Savannah", types: ["locality", "political"]}, 
// {long_name: "Chatham County", short_name: "Chatham County", types: ["administrative_area_level_2", "political"]}, 
// {long_name: "Georgia", short_name: "GA", types: ["administrative_area_level_1", "political"]}, 
// {long_name: "United States", short_name: "US", types: ["country", "political"]}, 
// {long_name: "31406", short_name: "31406", types: ["postal_code"]}, 
// {long_name: "4900", short_name: "4900", types: ["postal_code_suffix"]}]

