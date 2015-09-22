class PagesController < ApplicationController
  def show
    @page = Page.friendly.find(params[:id])
    authorize @page

    if !@page.published?
      flash.now[:warning] = %{This page is not published. It is only visible to
      admin users.}
    end

    custom_layout = @page.layout.to_s
    custom_layout = 'application' if custom_layout.empty?
    render layout: custom_layout
  end
end
