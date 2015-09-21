class PagesController < ApplicationController
  def show
    @page = Page.friendly.find(params[:id])
    authorize @page

    if !@page.published?
      flash.now[:warning] = %{This page is not published. It is only visible to
      admin users.}
    end
  end
end
