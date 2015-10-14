# Гражданство.
class Citizenship < ActiveRecord::Base
  has_paper_trail

  has_many :users
end
