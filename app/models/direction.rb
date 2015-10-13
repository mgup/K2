class Direction < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :direction_category
end
