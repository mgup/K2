# Учёная степень (доктор наук, кандидат наук).
class AcademicDegree < ActiveRecord::Base
  has_paper_trail

  has_many :persons
end
