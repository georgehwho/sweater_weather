class Api::V1::ForecastController < ApplicationController
  def index
    forecast = WeatherFacade.get_forecast(params[:location])
    if forecast.class == String
      return bad_request(forecast)
    else
      render json: ForecastSerializer.new(forecast), status: 200
    end
  end
end
