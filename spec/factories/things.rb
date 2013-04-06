# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coffeeshop, class: Thing do
    name 'A Coffeeshop'
    tags %w(coffeeshop wifi)

    after(:build) do |thing, evaluator|
      thing[:coffeeshop] = {
        name: 'Coffeeshop name',
        address: '123 Main St',
        phone_number: '608-555-1234'
      }

      thing[:wifi] = {
        free: true
      }
    end

    trait :no_wifi do
      after(:build) do |thing, evaluator|
        thing[:wifi] = {free: false}
      end
    end
  end
end
