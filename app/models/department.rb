# Подразделение.
class Department < ActiveRecord::Base
  has_paper_trail
  resourcify

  belongs_to :parent, class_name: 'Department'

  has_many :directions
  has_many :positions, class_name: 'Hr::Position'

  def to_param
    "#{id} #{name}".parameterize
  end
end
