class Admin::PagesController < ResourceController
  crud attributes: [:title, :body, :layout, :published, :slug]

  def before_processing_parameters
    params[:page][:slug] = nil if params[:page][:slug].to_s.empty?
  end
end
