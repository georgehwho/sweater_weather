class UnsplashService < BaseService
  class << self
    def get_image(location)
      request_api("/search/photos?query=#{location}&per_page=1")
    end

    def request_api(path)
      resp = conn('https://api.unsplash.com').get(path) do |f|
        f.headers['Accept-Version'] = 'v1'
        f.headers['Authorization'] = "Client-ID #{ENV['unsplash_key']}"
      end

      return 'Unsplash Issue' unless resp.success?
      parse_json(resp)
    end
  end
end