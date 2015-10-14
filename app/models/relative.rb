# Модель, представляющая родственника (человек, связанный родственной связью
# с пользователем, студентом и так далее).
class Relative < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :person, polymorphic: true
  belongs_to :relationship
end
