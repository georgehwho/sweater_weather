require 'rails_helper'

describe BookSearchFacade, :vcr do
  it 'returns a hash given a location' do
    json = BookSearchFacade.get_books('denver,co')

    expect(json).to be_an_instance_of(Hash)
  end
end