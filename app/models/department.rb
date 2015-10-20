# Подразделение.
class Department < ActiveRecord::Base
  has_closure_tree order: :name
  has_paper_trail

  has_many :positions, class_name: 'Hr::Position'

  def to_param
    "#{id} #{name}".parameterize
  end
end
