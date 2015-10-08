module SpaceScoping
  extend ActiveSupport::Concern

  def space
    @space ||= load_space_by_space_id || get_space_from_resource
  end

  def load_space_by_space_id
    params[:space_id] && Space.find(params[:space_id])
  end

  def get_space_from_resource
    resource.space
  end
end
