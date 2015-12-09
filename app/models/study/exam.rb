# Формы контроля на семестр на единицу учебного плана.
class Study::Exam < ActiveRecord::Base

  belongs_to :plan, class_name: 'Study::Plan'

end