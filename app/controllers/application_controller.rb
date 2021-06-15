class ApplicationController < ActionController::API
  def bad_request(error_message)
    render json: { error: error_message }, status: 400
  end
end
