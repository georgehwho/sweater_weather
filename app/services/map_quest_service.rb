class MapQuestService < BaseService
  class << self
    def request_api(path)
      resp = conn('http://www.mapquestapi.com').get(path) do |f|
        f.params['key'] = ENV['mapquest_key']
      end

      parse_json(resp)
    end
  end
end