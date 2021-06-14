class BookSearchFacade
  class << self
    def get_books(location)
      json = OpenLibraryService.request_api("/search.json?q=#{location}")
    end
  end
end