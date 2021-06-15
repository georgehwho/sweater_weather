class OpenWeatherService < BaseService
  class << self
    def get_one_call(coordinates)
      request_api("/data/2.5/onecall?lat=#{coordinates[:lat]}&lon=#{coordinates[:lng]}&units=imperial")
    end

    def request_api(path)
      resp = conn('https://api.openweathermap.org').get(path) do |f|
        f.params['appid'] = ENV['openweather_key']
      end

      return "OpenWeather Issue" unless resp.success?
      parse_json(resp)
    end
  end
end