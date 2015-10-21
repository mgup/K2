FactoryGirl.define do
  factory :hr_position, class: 'Hr::Position' do
    department

    association :qualification, factory: :hr_qualification
  end
end
