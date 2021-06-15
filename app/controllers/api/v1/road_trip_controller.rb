class Api::V1::RoadTripController < ApplicationController
  def create
    inputs = road_trip_params
    user = User.find_by(api_key: inputs[:api_key])
    if user
      trip = RoadTripFacade.get_road_trip(inputs[:origin], inputs[:destination])
      render json: RoadtripSerializer.new(trip), status: 200
    else
      render json: { error: 'Invalid API key' }, status: 404
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end