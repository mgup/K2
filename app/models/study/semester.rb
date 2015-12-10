# Учебный семестр.
class Study::Semester < ActiveRecord::Base
  has_many :classes, class_name: 'Study::Class', foreign_key: :semester
  has_many :zets, class_name: 'Study::Zet', foreign_key: :semester
  has_many :exams, class_name: 'Study::Exam', foreign_key: :semester
end
