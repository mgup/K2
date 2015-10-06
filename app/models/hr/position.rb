# Должности сотрудников вуза.
class Hr::Position < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :employee_category, class_name: 'EmployeeCategory'

  validates :employee_category, presence: true
end
