class Admin::UsersController < ApplicationController
  def index
    authorize User

    @users = User.order(:email).page params[:page]
  end
end
