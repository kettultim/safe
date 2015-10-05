class Admin::UsersController < ResourceController
  crud attributes: [:email, :password, :role]

  def before_processing_parameters
    params[:user].delete(:password) if params[:user][:password].empty?
  end
end
