FactoryGirl.define do
  factory :hr_qualification, class: 'Hr::Qualification' do
    name { Faker::Lorem.word }

    employee_category
  end
end
