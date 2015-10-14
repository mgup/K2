# Уровень образования.
class EducationLevel < ActiveRecord::Base
  has_paper_trail

  has_many :users
end
