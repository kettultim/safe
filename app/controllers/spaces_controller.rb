class SpacesController < ResourceController
  crud Space, attributes: [:name, :country, :description]

  def return_path
    host_dashboard_path
  end

  def after_building_resource
    @space.user = current_user
  end

  def index
    @available_countries = Space.uniq.pluck(:country)
  end

  def find_resources
    if params[:space] && params[:space][:country]
      @country = params[:space][:country]
      Space.where(country: @country).page params[:page]
    else
      Space.page params[:page]
    end
  end
end
