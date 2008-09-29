// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var map_element = document.getElementById('map');
if (map_element) {
  var map = new GMap2(map_element);

  // Give the map an initial centre of Melbourne, Australia
  var geocoder = new GClientGeocoder();
  geocoder.getLatLng("Melbourne, Australia", function(point) {
    if (!point) return;
  
    map.setCenter(point, 10);
  });

  // Add basic map controls
  map.addControl(new GMapTypeControl());
  map.addControl(new GLargeMapControl());
}