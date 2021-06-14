class OpenLibraryService < BaseService
  class << self
    def request_api(path)
      resp = conn('http://openlibrary.org').get(path)

      parse_json(resp)
    end
  end
end