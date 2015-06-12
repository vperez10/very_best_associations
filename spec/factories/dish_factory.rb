FactoryGirl.define do
  factory :dish do
    cuisine
    name { Faker::Commerce.department(1) }

    factory :dish_with_everything do
      favorites { create_list(:favorite, rand(5..10)) }
    end
  end
end
