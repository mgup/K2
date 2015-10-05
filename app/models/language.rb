# Язык.
class Language < ActiveRecord::Base
  acts_as_paranoid

  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage'
  has_many :users, through: :foreign_languages
end
