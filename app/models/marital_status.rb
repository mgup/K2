# Тип семейного положения.
class MaritalStatus < ActiveRecord::Base
  has_paper_trail

  has_many :persons
end
