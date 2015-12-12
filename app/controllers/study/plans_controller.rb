# Контроллер для работы с учебными планами.
class Study::PlansController < ApplicationController
  respond_to :html

  load_and_authorize_resource :direction
  load_and_authorize_resource

  def new
    @part = Study::PlanPart.find(params[:part_id])
    @part_plans = @direction.plans.from_part_id(@part_id)
                  .from_admission_year(params[:year])
  end
end
