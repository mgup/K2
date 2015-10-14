# Работа с подразделениями.
class DepartmentsController < ApplicationController
  access_control do
    allow :developers
  end

  respond_to :html

  def index
    @departments = Department.all
  end
end
