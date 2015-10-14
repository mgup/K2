# Документ об образовании.
class EducationDocument < ActiveRecord::Base
  has_paper_trail

  belongs_to :person, polymorphic: true
  belongs_to :direction

  validates :person, presence: true
  validates :institution, presence: true
  validates :name, presence: true
  validates :number, presence: true
  validates :year_of_ending, presence: true,
                             education_document_year_of_ending: true
  validates :direction_id, presence: true

  def direction
    Direction.unscoped do
      super
    end
  end
end
