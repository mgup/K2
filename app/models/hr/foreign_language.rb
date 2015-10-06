# Знание сотрудником иностранных языков.
class Hr::ForeignLanguage < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :language
  belongs_to :language_proficiency

  validates :user, presence: true
  validates :language, presence: true
  validates :language_proficiency, presence: true
end
