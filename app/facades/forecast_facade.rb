class ForecastFacade
  class << self
    def get_forecast(coordinate)
      json = OpenWeatherService.request_api("/data/2.5/onecall?lat=#{coordinate.lat}&lon=#{coordinate.lng}&units=imperial")
      Forecast.new(json)
    end
  end
end