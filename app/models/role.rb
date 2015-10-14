# Модель Роль пользователя.
class Role < ActiveRecord::Base
  acts_as_authorization_role
  has_paper_trail
end
