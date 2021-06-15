require 'rails_helper'

describe OpenWeatherService, :vcr do
  describe 'class methods' do
    context '.get_one_call' do
      it 'returns a good response' do
        resp = OpenWeatherService.get_one_call({lat: 50, lng: 50})

        expect(resp).to be_an_instance_of(Hash)
      end
    end
  end
end