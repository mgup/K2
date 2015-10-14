# Подразделение.
class Department < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :main_department, class_name: 'Department'

  has_many :subdepartments, class_name: 'Department',
                            foreign_key: 'main_department_id'
end
