require 'spec_helper'

describe ThingsController do
  describe 'index' do
    context 'searching' do
      describe 'tags parameter' do

        context 'with one item' do
          let(:params) { {tags: 'coffeeshop', format: :json} }
          before do
            FactoryGirl.create(:tag, :coffeeshop)
            @coffeeshop = FactoryGirl.create(:coffeeshop)
            @person = FactoryGirl.create(:person)
          end
          it 'returns objects that have the tag' do
            get :index, params
            expect(assigns[:things].to_a).to include(@coffeeshop)
          end
          it 'does not return objects that do not have the tag' do
            get :index, params
            expect(assigns[:things].to_a).to_not include(@person)
          end
        end

        context 'with many items' do
          it 'returns only objects that have all the tags'
        end
      end

      describe 'other parameters'
    end
  end
end
