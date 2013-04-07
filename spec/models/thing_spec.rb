require 'spec_helper'

describe Thing do
  describe 'instantiation' do
    context 'when setting a tag with required_field' do
      before do
        FactoryGirl.create(:tag, :coffeeshop)
      end

      context 'with all the required_fields' do
        it 'should be valid' do
          thing = FactoryGirl.create(:coffeeshop, name: 'Morning Brew', tags: ['coffeeshop'])
          thing.should be_valid
        end
      end

      context 'and missing one of the required_fields' do
        it 'should not be valid' do
          thing = Thing.create(name: 'Morning Brew', tags: ['coffeeshop'])
          thing.should_not be_valid
        end
      end
    end
  end
end
