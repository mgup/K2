# Должности сотрудников вуза.
class Hr::Qualification < ActiveRecord::Base
  has_paper_trail

  belongs_to :employee_category, class_name: 'EmployeeCategory'

  has_many :positions, class_name: 'Hr::Position'

  validates :employee_category, presence: true
end
