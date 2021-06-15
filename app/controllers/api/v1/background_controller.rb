class Api::V1::BackgroundController < ApplicationController
  def index
    background = BackgroundFacade.get_background(params[:location])
    if background.class == String
      return bad_request(background)
    else
      render json: ImageSerializer.new(background), status: 200
    end
  end
end