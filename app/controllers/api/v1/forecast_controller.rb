module Api
  module V1
    class ForecastController < ApplicationController
      def index
        if params[:location]
          coordinate = GeocodingFacade.get_coordinates(params[:location])
          forecast = ForecastFacade.get_forecast(coordinate)
          # current weather
            # datetime,
          # binding.pry
          render json: ForecastSerializer.new(forecast)
        else
          render json: { error: 'Something went wrong' }, status: 404
        end
      end
    end
  end
end