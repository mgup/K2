# Количество ЗЕТ в семестр на единицу учебного плана.
class Study::Zet < ActiveRecord::Base
  belongs_to :plan, class_name: 'Study::Plan'
end
