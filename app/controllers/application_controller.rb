class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    super || NullUser.new
  end

  def user_signed_in?
    !(NullUser === current_user)
  end

  def after_sign_in_path_for(user)
    return admin_index_path if user.admin?
    super
  end

  def user_not_authorized
    redirect_to root_path, danger: "You can't do that!"
  end
end
