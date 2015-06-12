FactoryGirl.define do
  factory :cuisine do
    name { Faker::Commerce.department(1) }

    factory :cuisine_with_everything do
      dishes { create_list(:dish_with_everything, rand(5..10)) }
    end
  end
end
