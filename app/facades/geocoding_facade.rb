class GeocodingFacade
  class << self
    def get_coordinates(location)
      json = MapQuestService.request_api("/geocoding/v1/address?location=#{location}")
      Coordinate.new(json[:results][0][:locations][0][:latLng])
    end
  end
end