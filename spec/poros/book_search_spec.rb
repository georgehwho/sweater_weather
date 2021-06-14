require 'rails_helper'

describe BookSearch, :vcr do
  it 'exists' do
    coordinate = GeocodingFacade.get_coordinates('denver,co')
    forecast = ForecastFacade.get_forecast(coordinate)
    books = BookSearchFacade.get_books('denver,co')

    search = BookSearch.new('denver,co', 5, forecast, books)

    expect(search).to be_an_instance_of(BookSearch)
    expect(search.destination).to eq('denver,co')
    expect(search.forecast[0]).to be_an_instance_of(Hash)
    expect(search.total_books_found).to eq(books[:numFound])
    expect(search.books.size).to eq(5)
  end
end