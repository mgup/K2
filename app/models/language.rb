# Язык.
class Language < ActiveRecord::Base
  has_paper_trail

  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage'
  has_many :persons, through: :foreign_languages
end
