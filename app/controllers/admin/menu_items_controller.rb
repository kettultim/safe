class Admin::MenuItemsController < ApplicationController
  def index
    @menu = Menu.find(params[:menu_id])
    @menu_items = @menu.items.ordered.all
    authorize MenuItem
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.items.build
    authorize @menu_item
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @menu_item = @menu.items.build(menu_item_params)
    authorize @menu_item

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

  def destroy
    @menu_item = MenuItem.find(params[:id])
    authorize @menu_item

    @menu_item.destroy

    redirect_to(
      admin_menu_items_path(@menu_item.menu),
      success: 'The menu item has been deleted.'
    )
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:link_label, :link_url, :weight)
  end
end
