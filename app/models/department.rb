# Подразделение.
class Department < ActiveRecord::Base
  has_paper_trail

  belongs_to :main_department, class_name: 'Department'

  has_many :subdepartments, class_name: 'Department',
                            foreign_key: 'main_department_id'
  has_many :positions, class_name: 'Hr::Position'
end
