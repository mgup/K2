# Стартовый контроллер приложения.
class WelcomeController < ApplicationController
  access_control do
    allow all
  end

  def index
  end
end
