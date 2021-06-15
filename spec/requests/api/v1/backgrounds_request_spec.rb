require 'rails_helper'

describe 'Backgrounds Request' do
  context 'happy path' do
    it 'returns a background request', :vcr do
      get '/api/v1/backgrounds?location=denver,co'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
    end
  end

  context 'sad path' do
    it 'returns an error' do
      get '/api/v1/backgrounds?locatio='

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
    end
  end
end