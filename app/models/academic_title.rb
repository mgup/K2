# Учёное звание (профессор, доцент).
class AcademicTitle < ActiveRecord::Base
  has_paper_trail

  has_many :users
end
