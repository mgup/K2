# Часы дисциплины из учебного плана.
class Study::Class < ActiveRecord::Base
  enum type: { lecture: 1, lab: 2, practice: 3, self_control: 4, self_work: 5, control: 6 }

  belongs_to :plan, class_name: 'Study::Plan'
end
