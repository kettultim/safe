class Admin::MenusController < ApplicationController
  def index
    authorize Menu
    @menus = Menu.order(:name).all
  end
end
