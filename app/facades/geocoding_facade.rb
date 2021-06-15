class GeocodingFacade
  class << self
    def get_coordinates(location)
      json = MapQuestService.get_location(location)
      if json[:results][0][:locations].empty?
        return 'Invalid Location'
      else
        json[:results][0][:locations][0][:latLng]
      end
    end
  end
end