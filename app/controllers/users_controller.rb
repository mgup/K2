class UsersController < ApplicationController
  access_control do
    # allow all
    allow :developers
  end

  respond_to :html

  def index
    @users = User.page(params[:page])
  end
end
