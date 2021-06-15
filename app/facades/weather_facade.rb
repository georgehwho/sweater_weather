require 'ostruct'

class WeatherFacade
  class << self
    def get_forecast(location)
      coordinate = GeocodingFacade.get_coordinates(location)
      return coordinate if coordinate.class == String

      data = OpenWeatherService.get_one_call(coordinate)

      forecast = OpenStruct.new(
        id: nil,
        current_weather: get_current_weather(data[:current]),
        daily_weather: get_daily_weather(data[:daily][0..4]),
        hourly_weather: get_hourly_weather(data[:hourly][0..7])
      )
    end

    def get_current_weather(data)
      {
        datetime: data[:dt],
        sunrise: data[:sunrise],
        sunset: data[:sunset],
        temperature: data[:temp],
        feels_like: data[:feels_like],
        humidity: data[:humidity],
        uvi: data[:uvi],
        visibility: data[:visibility],
        conditions: data[:weather][0][:description],
        icon: data[:weather][0][:icon],
      }
    end

    def get_daily_weather(daily_data)
      daily_data.map do |data|
        {
          date: data[:dt],
          sunrise: data[:sunrise],
          sunset: data[:sunset],
          max_temp: data[:temp][:max],
          min_temp: data[:temp][:min],
          conditions: data[:weather][0][:description],
          icon: data[:weather][0][:icon]
        }
      end
    end

    def get_hourly_weather(hourly_data)
      hourly_data.map do |data|
        {
          time: data[:dt],
          temperature: data[:temp],
          conditions: data[:weather][0][:description],
          icon: data[:weather][0][:icon]
        }
      end
    end
  end
end