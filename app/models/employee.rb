class Employee < ActiveRecord::Base
  has_paper_trail

  belongs_to :user

  has_one :person, as: :personable, dependent: :destroy
  accepts_nested_attributes_for :person

  has_many :positions, class_name: 'Hr::Position'

  delegate :full_name, to: :person

  def to_param
    "#{id} #{full_name}".parameterize
  end

  def to_s
    full_name
  end

  def works_in?(department)
    unless department.instance_of?(Department)
      department = Department.find_by(id: department)
    end

    return false unless department.present?

    positions.find_all { |p| department == p.department }.any?
  end
end
