require 'rails_helper'

describe 'Forecast Request' do
  context 'happy path' do
    it 'returns a forecast request', :vcr do
      get '/api/v1/forecast?location=denver,co'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data][:type]).to eq('forecast')
      expect(json[:data][:attributes]).to have_key(:current_weather)
      expect(json[:data][:attributes]).to have_key(:daily_weather)
      expect(json[:data][:attributes]).to have_key(:hourly_weather)
    end
  end

  context 'sad path' do
    it 'returns an error invalid location error', :vcr do
      get '/api/v1/forecast?location='

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(json[:error]).to eq('Invalid Location')
      expect(response.status).to eq(400)
    end
  end
end