# Учёная степень (доктор наук, кандидат наук).
class AcademicDegree < ActiveRecord::Base
  acts_as_paranoid

  has_many :users
end
