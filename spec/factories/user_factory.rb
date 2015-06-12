FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }

    factory :user_with_everything do
      favorites { create_list(:favorite, rand(5..10)) }
    end
  end
end
