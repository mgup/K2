class EducationDocument < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :has_education_document, polymorphic: true

  validates :institution, presence: true
  validates :name, presence: true
  validates :number, presence: true
  validates :year_of_ending, presence: true,
            education_document_year_of_ending: true
end
