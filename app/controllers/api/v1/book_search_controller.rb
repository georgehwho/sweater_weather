class Api::V1::BookSearchController < ApplicationController
  def index
    coordinate = GeocodingFacade.get_coordinates(params[:location])
    forecast = ForecastFacade.get_forecast(coordinate)
    books = BookSearchFacade.get_books(params[:location])

    search = BookSearch.new(params[:location], params[:quantity].to_i, forecast, books)
    render json: BooksSerializer.new(search)
  end
end