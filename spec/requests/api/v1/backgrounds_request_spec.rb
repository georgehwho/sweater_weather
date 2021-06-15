require 'rails_helper'

describe 'Backgrounds Request' do
  context 'happy path' do
    it 'returns a background request', :vcr do
      get '/api/v1/backgrounds?location=denver,co'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(json[:data].keys).to eq(%i[id type attributes])
      expect(json[:data][:attributes].keys).to eq(%i[image])
      expect(json[:data][:attributes][:image].keys).to eq(%i[location image_url credit])
      expect(json[:data][:attributes][:image][:credit].keys).to eq(%i[source author logo])
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