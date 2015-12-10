# Подразделение.
class Department < ActiveRecord::Base
  has_paper_trail
  resourcify

  belongs_to :parent, class_name: 'Department'

  has_many :children, class_name: 'Department', foreign_key: 'parent_id'
  has_many :directions
  has_many :positions, class_name: 'Hr::Position'

  default_scope { order(:name) }

  scope :without_parents, -> { where(parent_id: nil) }

  def to_param
    "#{id} #{name}".parameterize
  end
end
