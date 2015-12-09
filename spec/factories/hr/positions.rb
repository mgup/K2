FactoryGirl.define do
  factory :hr_position, class: 'Hr::Position' do
    department
    association :qualification, factory: :hr_qualification

    factory :position_in_otdel_informacionnyh_sistem do
      before(:create) do
        unless Department.find_by(id: 1).present?
          create(:otdel_informacionnyh_sistem)
        end
      end

      department_id 1
    end
  end
end
