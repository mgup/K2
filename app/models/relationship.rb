# Вид родственной связи.
class Relationship < ActiveRecord::Base
  acts_as_paranoid

  has_many :relatives
end
