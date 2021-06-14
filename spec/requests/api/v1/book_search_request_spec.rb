require 'rails_helper'

describe 'book search request' do
  it 'returns the book search result', :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:data][:type]).to eq('books')
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes]).to have_key(:total_books_found)
    expect(json[:data][:attributes]).to have_key(:books)

  end
end