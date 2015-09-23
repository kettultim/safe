class Admin::MenuItemsController < ApplicationController
  def index
    @menu = Menu.find(params[:menu_id])
    @menu_items = @menu.items.all
    authorize MenuItem
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
    authorize @menu_item
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    authorize @menu_item

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

  private

  def menu_item_params
    params.require(:menu_item).permit(:link_label, :link_url, :weight)
  end
end
