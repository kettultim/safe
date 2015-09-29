class Admin::UsersController < Admin::ResourcesController
  resource type: 'user', klass: User, allow: [:email, :password, :role]

  def before_assigning_parameters
    params[:user].delete(:password) if params[:user][:password].empty?
  end
end
