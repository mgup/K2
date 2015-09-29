# Стартовый контроллер приложения.
class WelcomeController < ApplicationController
  access_control do
    # allow all
    allow :developers
  end

  def index
  end
end
