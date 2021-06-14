class BookSearch
  attr_reader :id, :destination, :forecast, :total_books_found, :books

  def initialize(location, quantity=0, forecast, books)
    @destination = location
    @forecast = [summary: forecast.current_weather[:weather][0][:description],
                 temperature: forecast.current_weather[:temp].round.to_s + ' F']
    @total_books_found = books[:numFound]
    binding.pry
    @books = books[:docs].first(quantity).map { |doc| Book.new(doc) }
  end
end