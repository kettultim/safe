class DeviseOverrides::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: :create

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u[:role] = '' unless User.sign_up_roles.include? u[:role]
      u.permit(:role, :email, :password, :password_confirmation)
    end
  end

  respond_to :json
end
