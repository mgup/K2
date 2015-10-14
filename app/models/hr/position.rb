# Элементы штатного расписания (ставки определенных должностей
# в подразделениях и люди, которые их занимают).
class Hr::Position < ActiveRecord::Base
  belongs_to :department
  belongs_to :qualification, class_name: 'Hr::Qualification'
  belongs_to :user
end
