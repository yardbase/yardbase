require 'spec_helper'

describe ThingsController do
  describe 'index' do
    before do
      FactoryGirl.create(:tag, :coffeeshop)
      FactoryGirl.create(:tag, :wifi)
    end

    context 'searching' do
      describe 'tags parameter' do
        context 'with one item' do
          let(:params) { {tags: 'coffeeshop', format: :json} }
          before do
            @coffeeshop = FactoryGirl.create(:coffeeshop)
            @person = FactoryGirl.create(:person)
            @library = FactoryGirl.create(:library)
          end
          it 'returns objects that have the tag' do
            get :index, params
            expect(assigns[:things].to_a).to include(@coffeeshop)
          end
          it 'does not return objects that do not have any tags' do
            get :index, params
            expect(assigns[:things].to_a).to_not include(@person)
          end
          it 'does not return objects that do not have the tag, but have a different tag' do
            get :index, params
            expect(assigns[:things].to_a).to_not include(@library)
          end
        end

        context 'with multiple tags, wifi first' do
          let(:params) { {tags: 'wifi,coffeeshop', format: :json} }
          before do
            @coffeeshop = FactoryGirl.create(:coffeeshop)
            @library = FactoryGirl.create(:library)
          end
          it 'returns objects that have both the tags' do
            get :index, params
            expect(assigns[:things].to_a).to include(@coffeeshop)
          end
          it 'does not return objects that only have one of the tags' do
            get :index, params
            expect(assigns[:things].to_a).to_not include(@library)
          end
        end

        context 'with multiple tags, coffeeshop first' do
          let(:params) { {tags: 'coffeeshop,wifi', format: :json} }
          before do
            @coffeeshop = FactoryGirl.create(:coffeeshop)
            @library = FactoryGirl.create(:library)
          end
          it 'returns objects that have both the tags' do
            get :index, params
            expect(assigns[:things].to_a).to include(@coffeeshop)
          end
          it 'does not return objects that only have one of the tags' do
            get :index, params
            expect(assigns[:things].to_a).to_not include(@library)
          end
        end
      end

      describe 'other parameters' do
				describe 'key value pair' do
					let(:params) { {name: 'Indie Coffee'} }

					before do
            @indie_coffee = FactoryGirl.create(:coffeeshop, name: 'Indie Coffee')
					end

					it 'returns only objects with the specified key and value' do
            get :index, params
            expect(assigns[:things].to_a).to include(@indie_coffee)
					end
				end

				describe 'key value pair, nested inside of tag name' do
					let(:params) { {'coffeeshop.url' => 'http://indiecoffeehouse.com'} }

					before do
            @indie_coffee = FactoryGirl.create(:coffeeshop, name: 'Indie Coffee')
						Thing.where(name: 'Indie Coffee').update(:"coffeeshop.url" => 'http://indiecoffeehouse.com')
					end

					it 'returns only objects with the specified key and value' do
            get :index, params
            expect(assigns[:things].to_a).to include(@indie_coffee)
					end
				end
			end
    end
  end
end
