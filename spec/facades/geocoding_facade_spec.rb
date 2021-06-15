require 'rails_helper'

describe GeocodingFacade, :vcr do
  describe 'class methods' do
    context '.get_coordinates' do
      it 'happy path: returns a coordinate hash given a location' do
        coordinate = GeocodingFacade.get_coordinates('denver,co')

        expect(coordinate).to be_an_instance_of(Hash)
        expect(coordinate).to have_key(:lat)
        expect(coordinate).to have_key(:lng)
      end

      it 'sad path: location missing' do
        coordinate = GeocodingFacade.get_coordinates('')

        expect(coordinate).to be_an_instance_of(String)
        expect(coordinate).to eq('Invalid Location')
      end
    end
  end
end