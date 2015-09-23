class Admin::MenuItemsController < ApplicationController
  before_filter :load_menu, only: [:new, :create, :index]
  before_filter :build_menu_item, only: [:new, :create]
  before_filter :load_menu_item, only: [:edit, :update, :destroy]

  def index
    @menu_items = @menu.items.ordered.all
    authorize MenuItem
  end

  def new; end

  def create
    @menu_item.assign_attributes(menu_item_params)

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
    params.require(:menu_item).permit(:link_label, :link_url, :weight,
      :parent_id)
  end

  def load_menu
    @menu = Menu.find(params[:menu_id])
  end

  def load_menu_item
    @menu_item = MenuItem.find(params[:id])
    authorize @menu_item
  end

  def build_menu_item
    @menu_item = @menu.items.build
    authorize @menu_item
  end
end
