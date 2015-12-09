# Элементы штатного расписания (ставки определенных должностей
# в подразделениях и люди, которые их занимают).
class Hr::Position < ActiveRecord::Base
  has_paper_trail
  rolify

  belongs_to :department
  belongs_to :qualification, class_name: 'Hr::Qualification'
  belongs_to :employee

  scope :hired, -> { where('employee_id IS NOT NULL') }
  scope :vacant, -> { where('employee_id IS NULL') }

  delegate :name, to: :qualification

  def closed?
    employee.present?
  end
end
