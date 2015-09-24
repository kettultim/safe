class Admin::MenuItemsController < ApplicationController
  before_filter :load_menu, only: [:new, :create, :index]
  before_filter :build_and_authorize_menu_item, only: [:new, :create]
  before_filter :load_and_authorize_menu_item, only: [:edit, :update, :destroy]

  def index
    @menu_items = @menu.items.top_level.ordered
    authorize @menu_items
  end

  def new; end

  def create
    if @menu_item.save
      redirect_to(
        admin_menu_items_path(@menu),
        success: 'The menu item has been created.'
      )
    else
      flash.now[:danger] = 'The menu item could not be created.'
      render :edit
    end
  end

  def edit; end

  def update
    if @menu_item.update_attributes(menu_item_params)
      redirect_to(
        admin_menu_items_path(@menu_item.menu),
        success: 'The menu item has been updated.'
      )
    else
      flash.now[:danger] = 'The menu item could not be updated.'
      render :edit
    end
  end

  def destroy
    @menu_item.destroy

    redirect_to(
      admin_menu_items_path(@menu_item.menu),
      success: 'The menu item has been deleted.'
    )
  end

  private

  def menu_item_params
    return {} unless params[:menu_item]

    params.require(:menu_item).permit(:link_label, :link_url, :weight,
      :parent_id)
  end

  def load_menu
    @menu = Menu.find(params[:menu_id])
  end

  def load_and_authorize_menu_item
    @menu_item = MenuItem.find(params[:id])
    authorize @menu_item
  end

  def build_and_authorize_menu_item
    @menu_item = @menu.items.build(menu_item_params)
    authorize @menu_item
  end
end
