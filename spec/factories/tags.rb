# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name 'TagName'

    trait :coffeeshop do
      name 'coffeeshop'

      required_fields [
        {name: 'name', type: 'string'},
        {name: 'address', type: 'string'},
        {name: 'phone_number', type: 'string'}
      ]

      optional_fields [
        {name: 'url', type: 'string'}
      ]
    end
  end
end
