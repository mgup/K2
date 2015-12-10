# Справочная таблица Блоки учебного плана.
# 1 - Дисциплины (модули)
# 2 - Практики
# 3 - Государственная итоговая аттестация
class Study::PlanPart < ActiveRecord::Base

  has_many   :subparts, class_name: 'Study::PlanPart', foreign_key: :parent_id
  belongs_to :block, class_name: 'Study::PlanPart', foreign_key: :parent_id

  has_many   :plans, class_name: 'Study::Plan'

  scope :blocks, -> { where('parent_id IS NULL') }
end