require 'ostruct'

class RoadTripFacade
  class << self
    def get_road_trip(start_city, end_city)
      route = MapQuestService.get_route(start_city, end_city)
      time = Time.now + route[:route][:realTime]
      forecast = WeatherFacade.get_forecast(end_city)

      if time < (Time.now + 28_800)
        hour_forecast = forecast.hourly_weather.find { |hour| hour[:time].to_i == time.hour }
        weather = {
          temperature: hour_forecast[:temperature],
          conditions: hour_forecast[:conditions]
        }
      else
        weather = {
          temperature: nil,
          conditions: nil
        }
      end

      OpenStruct.new(
        id: nil,
        start_city: start_city.gsub(',',", "),
        end_city: end_city.gsub(',',"' "),
        travel_time: route[:route][:realTime],
        weather_at_eta: weather
      )
    end
  end
end