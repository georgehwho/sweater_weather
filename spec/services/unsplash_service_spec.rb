require 'rails_helper'

describe UnsplashService, :vcr do
  describe 'class methods' do
    context '.get_image' do
      it 'returns a good response' do
        resp = UnsplashService.get_image('denver,co')

        expect(resp).to be_an_instance_of(Hash)
      end
    end
  end
end