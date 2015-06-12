FactoryGirl.define do
  factory :venue do
    neighborhood
    name { Faker::Company.name }
    address { Faker::Address.street_address }

    factory :venue_with_everything do
      favorites { create_list(:favorite, rand(5..10)) }
    end
  end
end
