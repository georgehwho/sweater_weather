class MapQuestService < BaseService
  class << self
    def get_location(location)
      request_api("/geocoding/v1/address?location=#{location}")
    end

    def request_api(path)
      resp = conn('http://www.mapquestapi.com').get(path) do |f|
        f.params['key'] = ENV['mapquest_key']
      end

      parse_json(resp)
    end
  end
end