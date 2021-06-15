require 'rails_helper'

describe 'Sessions request' do
  describe 'post /users' do
    it 'happy path: returns email with api key', :vcr do
      post '/api/v1/users', params: {
        "email": "ligma1@example.com",
        "password": "password",
        "password_confirmation": "password"
      },
      as: :json

      post '/api/v1/sessions', params: {
        "email": "ligma1@example.com",
        "password": "password",
      },
      as: :json
      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data].keys).to eq(%i[id type attributes])
      expect(data[:data][:attributes].keys).to eq(%i[email api_key])
    end

    it 'sad path: gives correct error message', :vcr do
      post '/api/v1/users', params: {
        "email": "ligma1@example.com",
        "password": "password",
        "password_confirmation": "password"
      },
      as: :json

      post '/api/v1/sessions', params: {
        "email": "ligma1@example.com",
        "password": "pasword",
      },
      as: :json
      expect(response).to have_http_status(401)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data.keys).to eq(%i[error])
    end
  end
end