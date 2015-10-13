class DirectionCategory < ActiveRecord::Base
  acts_as_paranoid

  has_many :directions
end
