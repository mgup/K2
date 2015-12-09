FactoryGirl.define do
  factory :person do
    last_name { Faker::Name.male_last_name }
    first_name { Faker::Name.male_first_name }
  end
end
