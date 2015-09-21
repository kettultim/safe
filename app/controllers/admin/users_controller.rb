class Admin::UsersController < ApplicationController
  before_filter :load_and_authorize_user, only: [:edit, :update]

  def index
    authorize User
    @users = User.order(:email).page params[:page]
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to admin_users_path, success: 'The user has been created.'
    else
      flash.now[:danger] = 'The user could not be created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, success: 'The user has been updated.'
    else
      flash.now[:danger] = 'The user could not be updated.'
      render :edit
    end
  end

  private

  def load_and_authorize_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    p = params.require(:user).permit(:email, :password)
    p.delete(:password) if p[:password].empty?
    p
  end
end
