class Admin::PagesController < ApplicationController
  before_filter :load_and_authorize_page, only: [:edit, :update, :destroy]
  before_filter :build_and_authorize_page, only: [:new, :create]

  def index
    @pages = Page.order(:title).page params[:page]
    authorize @pages
  end

  def new; end

  def create
    if @page.save
      redirect_to page_path(@page), success: 'The page has been created.'
    else
      flash.now[:danger] = 'The page could not be created.'
      render :new
    end
  end

  def edit; end

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

  def build_and_authorize_page
    @page = Page.new(page_params)
    authorize @page
  end

  def page_params
    return {} unless params[:page]

    params[:page][:slug] = nil if params[:page][:slug].to_s.empty?
    params.require(:page).permit(:title, :body, :layout, :published, :slug)
  end
end
