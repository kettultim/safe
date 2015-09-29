class Admin::PagesController < Admin::ResourcesController
  resource(
    type: 'page',
    klass: Page,
    friendly: true,
    allow: [:title, :body, :layout, :published, :slug]
  )

  def before_assigning_parameters
    params[:page][:slug] = nil if params[:page][:slug].to_s.empty?
  end
end
