class ProfilesController < ResourceController
  crud attr: :profile

  def resource_params
    key = "#{current_user.role}_profile"

    return {} unless params[key]

    params.require(key).permit(:name, :country, :story, :photo)
  end

  def return_path
    edit_profile_path
  end

  def find_resource _junk
    current_user.profile
  end
end
