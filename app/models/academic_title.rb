# Учёное звание (профессор, доцент).
class AcademicTitle < ActiveRecord::Base
  acts_as_paranoid

  has_many :users
end
