FactoryGirl.define do
  factory :role do
    name Faker::Lorem.word

    factory :developer_role do
      name 'developer'
    end
  end
end
