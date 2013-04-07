FactoryGirl.define do
  factory :tag do
    name 'TagName'

    trait :coffeeshop do
      name 'coffeeshop'

      required_fields [
        {name: 'address', type: 'string'}
      ]

      optional_fields [
        {name: 'phone_number', type: 'string'},
        {name: 'url', type: 'string'}
      ]
    end

    trait :wifi do
      name 'wifi'

      required_fields [
        {name: 'free', type: 'boolean'}
      ]
    end

    trait :person do
      name 'person'
    end
  end
end
