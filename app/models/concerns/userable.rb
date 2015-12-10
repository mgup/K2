# Функционал, добавляющий к модели возможность вести себя как
# «зарегистрированный пользователь системы»: обладать электронной почтой
# для входа, паролем и так далее.
module Userable
  extend ActiveSupport::Concern

  included do
    has_one :user, as: :userable, dependent: :destroy
    accepts_nested_attributes_for :user, allow_destroy: true

    delegate :email, to: :user
  end
end
