class Admin::UsersController < ApplicationController
  before_filter :load_and_authorize_user, only: [:edit, :update]
  before_filter :build_and_authorize_user, only: [:new, :create]

  def index
    @users = User.order(:email).page params[:page]
    authorize @users
  end

  def new; end

  def create
    if @user.save
      redirect_to admin_users_path, success: 'The user has been created.'
    else
      flash.now[:danger] = 'The user could not be created.'
      render :new
    end
  end

  def edit; end

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

  def build_and_authorize_user
    @user = User.new(user_params)
    authorize @user
  end

  def user_params
    return {} if params[:user] == nil

    attrs = params.require(:user).permit(:email, :password, :role)
    attrs.delete(:password) if attrs[:password].empty?

    attrs
  end
end
