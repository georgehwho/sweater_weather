require 'ostruct'

class RoadTripFacade
  class << self
    def get_road_trip(start_city, end_city)
      route = MapQuestService.get_route(start_city, end_city)

      # coordinates = route[:route][:locations][1][:latLng]
      OpenStruct.new(
        id: nil,
        start_city: start_city.gsub(',',", "),
        end_city: end_city.gsub(',',"' "),
        travel_time: route[:route][:realTime],
        weather_at_eta: {
          temperature: 40,
          conditions: 'nice!'
        }
      )
    end
  end
end