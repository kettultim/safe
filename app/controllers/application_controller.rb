class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_filter :load_menus

  add_flash_types :success, :info, :warning, :danger

  def current_user
    super || NullUser.new
  end

  def user_signed_in?
    !(NullUser === current_user)
  end

  def after_sign_in_path_for(user)
    user.admin ? admin_index_path : super
  end

  def user_not_authorized
    redirect_to root_path, danger: "You can't do that!"
  end

  def load_menus
    @main_menu = Menu.find_by_key('main')
  end
end
