require 'rails_helper'

describe 'Road Trip request' do
  describe 'post /road_trip' do
    it 'happy path: returns complete response', :vcr do
      post '/api/v1/users', params: {
        "email": "ligma1@example.com",
        "password": "password",
        "password_confirmation": "password"
      },
      as: :json

      user_data = JSON.parse(response.body, symbolize_names: true)

      post '/api/v1/road_trip', params: {
        "origin": "Alexandria,VA",
        "destination": "Manassas,VA",
        "api_key": user_data[:data][:attributes][:api_key]
      },
      as: :json

      road_trip_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(road_trip_data[:data].keys).to eq(%i[id type attributes])
      expect(road_trip_data[:data][:attributes].keys).to eq(%i[start_city end_city travel_time weather_at_eta])
      expect(road_trip_data[:data][:attributes][:weather_at_eta].keys).to eq(%i[temperature conditions])
    end
  end

  it 'sad path: bad api_key', :vcr do
    post '/api/v1/road_trip', params: {
      "origin": "Alexandria,VA",
      "destination": "Manassas,VA",
      "api_key": ''
    },
    as: :json

    expect(response).to have_http_status(404)
  end

  it 'sad path: too far distance', :vcr do
    post '/api/v1/users', params: {
      "email": "ligma1@example.com",
      "password": "password",
      "password_confirmation": "password"
    },
    as: :json

    user_data = JSON.parse(response.body, symbolize_names: true)

    post '/api/v1/road_trip', params: {
      "origin": "Alexandria,VA",
      "destination": "Denver,CO",
      "api_key": user_data[:data][:attributes][:api_key]
    },
    as: :json

    road_trip_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(200)
    expect(road_trip_data[:data].keys).to eq(%i[id type attributes])
    expect(road_trip_data[:data][:attributes].keys).to eq(%i[start_city end_city travel_time weather_at_eta])
    expect(road_trip_data[:data][:attributes][:weather_at_eta].keys).to eq(%i[temperature conditions])
  end
end