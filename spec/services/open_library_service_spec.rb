require 'rails_helper'

describe OpenLibraryService, :vcr do
  it 'exists' do
    service = OpenLibraryService.new

    expect(service).to be_an_instance_of(OpenLibraryService)
  end

  it 'can request api' do
    path = '/search.json?q=denver,co'

    resp = OpenLibraryService.request_api(path)

    expect(resp).to be_an_instance_of(Hash)
  end
end