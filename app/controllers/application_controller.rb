class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    super || NullUser.new
  end

  def user_signed_in?
    super && current_user.class != NullUser
  end
end
