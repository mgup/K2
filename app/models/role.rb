# Модель Роль пользователя.
class Role < ActiveRecord::Base
  acts_as_authorization_role
  acts_as_paranoid
end
