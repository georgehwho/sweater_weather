require 'rails_helper'

describe 'Users request' do
  describe 'post /users' do
    it 'happy path: creates a user and returns email with api key', :vcr do
      post '/api/v1/users', params: {
        "email": "ligma1@example.com",
        "password": "password",
        "password_confirmation": "password"
      },
      as: :json
      expect(response).to have_http_status(201)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data].keys).to eq(%i[id type attributes])
      expect(data[:data][:attributes].keys).to eq(%i[email api_key])
    end

    it 'sad path: gives correct error message' do
      post '/api/v1/users', params: {
        "email": "fail@example.com",
        "password": "password",
        "password_confirmation": "pasword"
      },
      as: :json
      expect(response).to have_http_status(422)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data.keys).to eq(%i[password_confirmation])
    end
  end
end