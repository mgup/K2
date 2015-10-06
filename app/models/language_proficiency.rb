# Степень знания иностранного языка.
class LanguageProficiency < ActiveRecord::Base
  acts_as_paranoid

  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage'
end
