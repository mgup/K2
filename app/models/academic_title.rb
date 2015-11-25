# Учёное звание (профессор, доцент).
class AcademicTitle < ActiveRecord::Base
  has_paper_trail

  has_many :persons
end
