# Контроллер для работы с сотрудниками.
class UsersController < ApplicationController
  access_control do
    # allow all
    allow :developers
  end

  respond_to :html
  respond_to :pdf, only: [:show]

  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page])
  end

  def new
    @user.foreign_languages.build
    @user.foreign_languages.build
  end

  def show
    @filename = "Личная карточка сотрудника #{@user.short_name}.pdf"
  end

  def edit
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
    params.require(:user).permit(:last_name, :first_name, :patronymic,
                                 :birthdate, :birthplace, :sex, :citizenship_id,
                                 foreign_languages_attributes: [
                                   :id, :language_id, :language_proficiency_id,
                                   :_destroy
                                 ])
  end
end
