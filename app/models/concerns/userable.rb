# Функционал, добавляющий к модели возможность вести себя как
# «зарегистрированный пользователь системы»: обладать электронной почтой
# для входа, паролем и так далее.
module Userable
  extend ActiveSupport::Concern

  included do
    belongs_to :user
  end
end
