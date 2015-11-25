# Работа с подразделениями.
class DepartmentsController < ApplicationController
  respond_to :html

  load_and_authorize_resource

  def index
    @departments = Department.hash_tree
  end

  def show
    @department = Department.find(params[:id])
  end
end
