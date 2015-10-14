# Вид родственной связи.
class Relationship < ActiveRecord::Base
  has_paper_trail

  has_many :relatives
end
