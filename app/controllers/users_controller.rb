# Контроллер для работы с сотрудниками.
class UsersController < ApplicationController
  respond_to :html
  respond_to :pdf, only: [:show]

  load_and_authorize_resource

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page])
  end

  def new
    2.times { @user.foreign_languages.build }
    @user.education_documents.build
  end

  def show
    @filename = "Личная карточка сотрудника #{@user.short_name}.pdf"
    (2 - @user.education_documents.count).times do
      @user.education_documents.build
    end
  end

  def edit
    (2 - @user.person.foreign_languages.count).times do
      @user.person.foreign_languages.build
    end
    (1 - @user.person.education_documents.count).times do
      @user.person.education_documents.build
    end
  end

  def update
    if @user.update(user_params)
      respond_with @user, location: -> { users_path }
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params
      .require(:user)
      .permit(person_attributes: [
        :id, :last_name, :first_name, :patronymic, :birthdate, :birthplace,
        :sex, :citizenship_id, :education_level_id,
        {
          foreign_languages_attributes: foreign_languages_attributes,
          education_documents_attributes: education_documents_attributes,
          relatives_attributes: relatives_attributes
        }
      ])
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
