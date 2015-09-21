class PagesController < ApplicationController
  def show
    @page = Page.friendly.find(params[:id])
    authorize @page
  end
end
