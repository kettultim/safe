class Admin::PagesController < ApplicationController
  before_filter :load_and_authorize_page, only: [:edit, :update, :destroy]

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
      redirect_to page_path(@page), success: 'The page has been created.'
    else
      flash.now[:danger] = 'The page could not be created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(page_params)
      redirect_to admin_pages_path, success: 'The page has been updated.'
    else
      flash.now[:danger] = 'The page could not be updated.'
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path, success: 'The page has been deleted.'
  end

  private

  def load_and_authorize_page
    @page = Page.friendly.find(params[:id])
    authorize @page
  end

  def page_params
    params[:page][:slug] = nil if params[:page][:slug].to_s.empty?
    params.require(:page).permit(:title, :body, :layout, :published, :slug)
  end
end
