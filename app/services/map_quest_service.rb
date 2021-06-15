class MapQuestService < BaseService
  class << self
    def get_route(start_city, end_city)
      request_api("/directions/v2/route?from=#{start_city}&to=#{end_city}")
    end

    def get_location(location)
      request_api("/geocoding/v1/address?location=#{location}")
    end

    def request_api(path)
      resp = conn('http://www.mapquestapi.com').get(path) do |f|
        f.params['key'] = ENV['mapquest_key']
      end

      return "MapQuest Issue" unless resp.success?
      parse_json(resp)
    end
  end
end