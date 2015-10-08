class PhotosController < ResourceController
  include SpaceScoping
  crud SpacePhoto, attributes: [:image]

  def find_resources
    space.photos.all
  end

  def authorize_resources
    SpacePolicy.new(current_user, space).update?
  end

  def after_building_resource
    space_photo.space_id = space.id
  end

  def return_path
    space_photos_path(space)
  end
end
