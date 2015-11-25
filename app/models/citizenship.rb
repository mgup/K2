# Гражданство.
class Citizenship < ActiveRecord::Base
  has_paper_trail

  has_many :persons
end
