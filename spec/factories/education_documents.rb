FactoryGirl.define do
  factory :education_document do
    institution { Faker::University.name }
    name { ['диплом', 'диплом с отличием'].sample }
    number { Faker::Number.number(8) }
    year_of_ending { Faker::Date.between(5.years.ago, 1.year.ago).year }

    direction
    association :person, factory: :user
  end
end
