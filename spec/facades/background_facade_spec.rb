require 'rails_helper'

describe BackgroundFacade, :vcr do
  describe 'class methods' do
    context '.get_background' do
      it 'happy path: returns a coordinate hash given a location' do
        background = BackgroundFacade.get_background('denver,co')

        expect(background).to be_an_instance_of(OpenStruct)
        expect(background.image.keys).to eq(%i[location image_url credit])
        expect(background.image[:credit].keys).to eq(%i[source author logo])
      end

      it 'sad path: location missing' do
        background = BackgroundFacade.get_background('')

        expect(background).to be_an_instance_of(String)
        expect(background).to eq('Location Invalid')
      end
    end
  end
end