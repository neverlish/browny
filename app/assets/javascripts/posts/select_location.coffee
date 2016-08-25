location_data = if gon.location_data then gon.location_data else nil

$selectCity = $('#select_city')
$selectPlace = $('#select_place')
$selectSpot = $('#select_spot')

adjustSelectablePlaces = (cityId) ->
	alert(cityId)
	selectedCityData = location_data.find (location_datum) ->
		location_datum.id == cityId

	alert(selectedCityData)

	options = selectedCityData.children.map (place) ->
		$('<option>', { value: place.id, text: place.name })

	$selectPlace.html('')

	$.each options, (index, option) ->
		$selectPlace.append(option)

$selectCity.change ->
	adjustSelectablePlaces($(this).val())



	