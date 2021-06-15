class GeocodingFacade
  class << self
    def get_coordinates(location)
      location_resp = MapQuestService.get_location(location)
      if location_resp.class == String
        return location_resp
      elsif location_resp[:results][0][:locations].empty?
        return 'Invalid Location'
      else
        location_resp[:results][0][:locations][0][:latLng]
      end
    end
  end
end