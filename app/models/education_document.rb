# Документ об образовании.
class EducationDocument < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :person, polymorphic: true

  validates :person, presence: true
  validates :institution, presence: true
  validates :name, presence: true
  validates :number, presence: true
  validates :year_of_ending, presence: true,
                             education_document_year_of_ending: true
end
