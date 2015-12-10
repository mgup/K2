FactoryGirl.define do
  factory :hr_position, class: 'Hr::Position' do
    department
    association :qualification, factory: :hr_qualification

    {
      otdel_informacionnyh_sistem: 1,
      otdel_kadrov: 38,
      obschiy_otdel: 40
    }.each do |department_name, department_id|
      factory "position_in_#{department_name}".to_sym do
        before(:create) do
          unless Department.find_by(id: department_id).present?
            create(department_name)
          end
        end

        department_id department_id
      end
    end
  end
end
