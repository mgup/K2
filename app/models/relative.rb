# Модель, представляющая родственника (человек, связанный родственной связью
# с пользователем, студентом и так далее).
class Relative < ActiveRecord::Base
  has_paper_trail

  belongs_to :person, polymorphic: true
  belongs_to :relationship
end
