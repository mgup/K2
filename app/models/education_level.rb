# Уровень образования.
class EducationLevel < ActiveRecord::Base
  acts_as_paranoid

  has_many :users
end