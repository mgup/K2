FactoryGirl.define do
  factory :employee do
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }

    last_name { Faker::Name.male_last_name }
    first_name { Faker::Name.male_first_name }

    factory :developer do
      after(:create) do |user|
        user.has_role!(:developer)
      end
    end
  end
end
