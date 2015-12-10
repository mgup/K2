# Работа с подразделениями.
class DepartmentsController < ApplicationController
  respond_to :html

  load_and_authorize_resource
  skip_load_resource only: [:index]

  def index
    @departments = Department.without_parents
  end

  def show
  end
end
