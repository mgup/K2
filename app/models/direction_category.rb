# Укрупнённая группа специальностей (направлений).
class DirectionCategory < ActiveRecord::Base
  has_paper_trail

  has_many :directions
end
