class AvailabilitiesController < ResourceController
  crud Availability, attributes: [:start_date, :end_date]

  def find_resources
    space.availabilities.all
  end

  def authorize_resources
    SpacePolicy.new(current_user, @space).update?
  end

  def space
    @space ||= (params[:space_id] && Space.find(params[:space_id])) || space_photo.space
  end

  def after_building_resource
    @availability.space_id = space.id
  end

  def return_path
    space_availabilities_path(space)
  end
end
