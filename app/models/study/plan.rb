# Элементы учебного плана отдельного профиля.
class Study::Plan < ActiveRecord::Base
  has_many :classes, class_name: 'Study::Class'
  has_many :zets, class_name: 'Study::Zet'
  has_many :exams, class_name: 'Study::Exam'

  belongs_to :part, class_name: 'Study::PlanPart'
  belongs_to :department
  belongs_to :direction

  scope :from_admission_year, -> (year) { where(admission_year: year) }
  scope :from_part_id, -> (part_id) { where(part_id: part_id) }
end
