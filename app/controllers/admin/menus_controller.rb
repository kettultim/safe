class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.order(:name).all
    authorize @menus
  end
end
