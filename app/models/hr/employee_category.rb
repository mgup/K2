# Категории (типы) сотрудников вуза.
class Hr::EmployeeCategory < ActiveRecord::Base
  acts_as_paranoid

  has_many :positions, class_name: 'Hr::Position'
end
