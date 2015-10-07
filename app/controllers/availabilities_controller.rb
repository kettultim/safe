class AvailabilitiesController < ResourceController
  include SpaceScoping
  crud attributes: [:start_date, :end_date]

  def find_resources
    space.availabilities.all
  end

  def authorize_resources
    SpacePolicy.new(current_user, @space).update?
  end

  def after_building_resource
    @availability.space_id = space.id
  end

  def return_path
    space_availabilities_path(space)
  end
end
