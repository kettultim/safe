class Admin::PagesController < ApplicationController
  def index
    authorize Page

    @pages = Page.order(:title).page params[:page]
  end

  def new
    @page = Page.new
    authorize @page
  end

  def create
    @page = Page.new page_params
    authorize @page

    if @page.save
      redirect_to page_path(@page)
    else
      render :new
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
