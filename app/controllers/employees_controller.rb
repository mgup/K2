# Контроллер для работы с сотрудниками.
class EmployeesController < ApplicationController
  respond_to :html
  respond_to :pdf, only: [:show]

  load_and_authorize_resource

  before_action :set_employee, only: [:show, :edit, :update]

  def index
    @employees = Employee.page(params[:page])
  end

  def new
    @employee.build_person
    2.times { @employee.person.foreign_languages.build }
    @employee.person.education_documents.build
  end

  def show
    @filename = "Личная карточка сотрудника #{@employee.short_name}.pdf"
    (2 - @employee.education_documents.count).times do
      @employee.education_documents.build
    end
  end

  def edit
    (2 - @employee.person.foreign_languages.count).times do
      @employee.person.foreign_languages.build
    end

    education_documents = @employee.person.education_documents
    education_documents.build if education_documents.empty?
  end

  def create
    @employee = User.new(user_params)

    if @employee.save
      respond_with @employee, location: -> { employees_path }
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      respond_with @employee, location: -> { employees_path }
    else
      render :edit
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params
      .require(:employee)
      .permit(person_attributes: [
        :id, :last_name, :first_name, :patronymic, :birthdate, :birthplace,
        :sex, :citizenship_id, :education_level_id, nested_models_attributes
      ])
  end

  def nested_models_attributes
    {
      foreign_languages_attributes: foreign_languages_attributes,
      education_documents_attributes: education_documents_attributes,
      relatives_attributes: relatives_attributes
    }
  end

  def foreign_languages_attributes
    [
      :id, :language_id, :language_proficiency_id,
      :_destroy
    ]
  end

  def education_documents_attributes
    [
      :id, :institution, :name, :series, :number, :year_of_ending,
      :qualification, :direction_id, :_destroy
    ]
  end

  def relatives_attributes
    [
      :id, :name, :relationship_id, :year_of_birth, :_destroy
    ]
  end
end
