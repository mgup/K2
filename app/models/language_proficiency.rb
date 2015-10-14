# Степень знания иностранного языка.
class LanguageProficiency < ActiveRecord::Base
  has_paper_trail

  has_many :foreign_languages, class_name: 'Hr::ForeignLanguage'
end
