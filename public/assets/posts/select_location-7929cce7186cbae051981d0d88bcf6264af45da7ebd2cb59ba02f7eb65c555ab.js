(function() {
  var $selectCity, $selectPlace, $selectSpot, adjustSelectablePlaces, location_data;

  location_data = gon.location_data ? gon.location_data : nil;

  $selectCity = $('#select_city');

  $selectPlace = $('#select_place');

  $selectSpot = $('#select_spot');

  adjustSelectablePlaces = function(cityId) {
    var options, selectedCityData;
    alert(cityId);
    selectedCityData = location_data.find(function(location_datum) {
      return location_datum.id === cityId;
    });
    alert(selectedCityData);
    options = selectedCityData.children.map(function(place) {
      return $('<option>', {
        value: place.id,
        text: place.name
      });
    });
    $selectPlace.html('');
    return $.each(options, function(index, option) {
      return $selectPlace.append(option);
    });
  };

  $selectCity.change(function() {
    return adjustSelectablePlaces($(this).val());
  });

}).call(this);
