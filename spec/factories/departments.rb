FactoryGirl.define do
  factory :department do
    id { Faker::Number.number(6) }

    factory :otdel_informacionnyh_sistem do
      id 1
    end

    factory :otdel_kadrov do
      id 38
    end

    factory :obschiy_otdel do
      id 40
    end
  end
end
