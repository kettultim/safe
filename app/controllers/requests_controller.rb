class RequestsController < ResourceController
  include SpaceScoping

  crud attr: :space_request, param_key: :request, attributes: [:email, :message]

  def after_building_resource
    @space_request.space_id = space.id
    @space_request.user_id  = current_user.id
  end

  def on_creation_failure
    redirect_to return_path
  end

  def on_creation_success
    RequestMailer.notify_host(space_request.id).deliver_now

    redirect_to return_path
  end

  def return_path
    space_path space
  end
end
