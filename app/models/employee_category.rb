# Категории (типы) сотрудников вуза.
class EmployeeCategory < ActiveRecord::Base
  has_paper_trail

  has_many :qualifications, class_name: 'Hr::Qualification'
end
