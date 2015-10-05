class SpacesController < ResourceController
  crud Space, attributes: [:name, :country, :description]

  def return_path
    host_dashboard_path
  end

  def after_building_resource
    @space.user = current_user
  end
end
