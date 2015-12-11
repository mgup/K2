# Формы контроля на семестр на единицу учебного плана.
class Study::Exam < ActiveRecord::Base
  enum type: { exam: 1, test: 2, test_mark: 3, project: 4, work: 5 }
  belongs_to :plan, class_name: 'Study::Plan'
end
