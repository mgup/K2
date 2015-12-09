FactoryGirl.define do
  factory :employee do
    user

    factory :employee_with_position_in_otdel_informacionnyh_sistem do
      after(:create) do |employee|
        create(:position_in_otdel_informacionnyh_sistem, employee: employee)
      end
    end
  end
end
