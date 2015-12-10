# Контроллер для просмотра учебных планов направлений
class Study::DirectionsController < ApplicationController
  respond_to :html

  load_and_authorize_resource

  def index
    @directions = @directions.accredited.group_by(&:department)
                  .group_by { |d, _| d.parent }
  end

  def show
    @plans = @direction.plans.from_admission_year(params[:year])
  end
end
