# Элементы штатного расписания (ставки определенных должностей
# в подразделениях и люди, которые их занимают).
class Hr::Position < ActiveRecord::Base
  has_paper_trail
  rolify

  belongs_to :department
  belongs_to :qualification, class_name: 'Hr::Qualification'
  belongs_to :user

  scope :hired, -> { where('user_id IS NOT NULL') }
  scope :vacant, -> { where('user_id IS NULL') }

  alias :employee :user

  delegate :name, to: :qualification

  def closed?
    employee.present?
  end
end
