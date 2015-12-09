# Контроллер для работы с приказами, которые регистрирует Общий отдел.
class Study::PlansController < ApplicationController
  respond_to :html

  load_and_authorize_resource

  def study_plans

  end

end