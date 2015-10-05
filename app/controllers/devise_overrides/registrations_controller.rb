class DeviseOverrides::RegistrationsController < Devise::RegistrationsController
 before_filter :configure_permitted_parameters, only: :create

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:role, :email, :password, :password_confirmation)
    end
  end
end
