# Знание сотрудником иностранных языков.
class Hr::ForeignLanguage < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :language
end
