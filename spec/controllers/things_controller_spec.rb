require 'spec_helper'

describe ThingsController do

  describe 'index' do
    let!(:cs_tag) { FactoryGirl.create(:tag, :coffeeshop) }
    let!(:person_tag) { FactoryGirl.create(:tag, :person) }
    let!(:wifi_tag) { FactoryGirl.create(:tag, :wifi) }

    let!(:coffeeshop) { FactoryGirl.create(:coffeeshop) }
    let!(:person) { FactoryGirl.create(:person) }
    let!(:library) { FactoryGirl.create(:library) }

    subject { assigns[:things].to_a }
    before { get :index, params }

    context 'searching' do
      describe 'tags parameter' do
        context 'with one item' do
          let(:params) { {tags: 'coffeeshop', jsonpCallback: 'Yardbase.Query.callbacks[1365350292336]'} }

          it { should include coffeeshop }
          it { should_not include person }
          it { should_not include library }
        end

        context 'with multiple tags, wifi first' do
          let(:params) { {tags: 'wifi,coffeeshop'} }

          it { should include coffeeshop }
          it { should_not include library }
        end

        context 'with multiple tags, coffeeshop first' do
          let(:params) { {tags: 'coffeeshop,wifi'} }

          it { should include coffeeshop }
          it { should_not include library }
        end
      end

      describe 'other parameters' do
        let!(:indie_coffee) { FactoryGirl.create(:coffeeshop, name: 'Indie Coffee') }

        describe 'key value pair' do
          let(:params) { {name: 'Indie Coffee'} }

          it { should include indie_coffee }
        end

        describe 'key value pair, nested inside of tag name' do
          let(:params) { {'coffeeshop.url' => 'http://indiecoffeehouse.com'} }

          before do
            Thing.where(name: 'Indie Coffee').update(:"coffeeshop.url" => 'http://indiecoffeehouse.com')
          end

          it { should include indie_coffee }
        end
      end
    end
  end
end
