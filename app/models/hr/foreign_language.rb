# Знание сотрудником иностранных языков.
class Hr::ForeignLanguage < ActiveRecord::Base
  has_paper_trail

  belongs_to :user
  belongs_to :language
  belongs_to :language_proficiency

  validates :language, presence: true
  validates :language_proficiency, presence: true
end
