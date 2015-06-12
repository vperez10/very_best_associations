FactoryGirl.define do
  factory :favorite do
    user
    venue
    dish
    notes { Faker::Hacker.say_something_smart }


  end
end
