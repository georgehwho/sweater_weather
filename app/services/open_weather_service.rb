class OpenWeatherService < BaseService
  class << self
    def request_api(path)
      resp = conn('https://api.openweathermap.org').get(path) do |f|
        f.params['appid'] = ENV['openweather_key']
      end

      parse_json(resp)
    end
  end
end