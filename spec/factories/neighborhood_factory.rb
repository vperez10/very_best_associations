FactoryGirl.define do
  factory :neighborhood do
    name { Faker::Address.city }

    factory :neighborhood_with_everything do
      venues { create_list(:venue_with_everything, rand(5..10)) }
    end
  end
end
