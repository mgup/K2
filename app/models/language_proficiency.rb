# Степень знания иностранного языка.
class LanguageProficiency < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :foreign_languages, class_name: 'Hr::ForeignLanguage'
end
