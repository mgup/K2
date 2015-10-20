# Работа с подразделениями.
class DepartmentsController < ApplicationController
  access_control do
    allow :developers
  end

  respond_to :html

  def index
    @departments = Department.hash_tree
  end

  def show
    @department = Department.find(params[:id])
  end
end
