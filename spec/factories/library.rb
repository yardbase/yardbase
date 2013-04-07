FactoryGirl.define do
  factory :library, class: Thing do
    name 'Madison Public Library'
    tags ['wifi']

    after(:build) do |thing, evaluator|
      thing[:wifi] = {
        free: true
      }
    end
  end
end
