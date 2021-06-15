require 'rails_helper'

describe MapQuestService, :vcr do
  describe 'class methods' do
    context '.get_location' do
      it 'returns a good response' do
        resp = MapQuestService.get_location('denver,co')

        expect(resp).to be_an_instance_of(Hash)
      end
    end
  end
end