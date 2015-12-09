# Модель, представляющая сотрудника университета.
class Employee < ActiveRecord::Base
  include Personable, Userable

  has_paper_trail

  has_many :positions, class_name: 'Hr::Position'

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

  def has_role!(role)
    positions.reduce(false) { |result, position| result || position.has_role!() }
  end
end
