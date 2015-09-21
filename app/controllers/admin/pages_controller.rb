class Admin::PagesController < ApplicationController
  def index
    authorize Page

    @pages = Page.order(:title).page params[:page]
  end
end
