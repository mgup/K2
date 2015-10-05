# Должности сотрудников вуза.
class Hr::Position < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :employee_category, class_name: 'EmployeeCategory'

  validates_presence_of :employee_category
end
