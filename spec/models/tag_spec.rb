require 'spec_helper'

describe Tag do

  describe 'key_type' do
    context 'for string' do
      it 'returns "string"' do
        tag = FactoryGirl.create(:tag, :coffeeshop)
        expect(Tag.key_type('coffeeshop.address')).to eq('string')
      end
    end
  end
end
