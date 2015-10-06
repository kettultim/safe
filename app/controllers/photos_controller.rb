class PhotosController < ResourceController
  crud SpacePhoto, attributes: [:image]

  def find_resources
    space.photos.all
  end

  def space
    @space ||= (params[:space_id] && Space.find(params[:space_id])) || space_photo.space
  end

  def after_building_resource
    @space_photo.space_id = space.id
  end

  def return_path
    space_photos_path(space)
  end
end
