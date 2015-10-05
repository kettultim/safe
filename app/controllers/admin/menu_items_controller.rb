class Admin::MenuItemsController < ResourceController
  crud attributes: [:link_label, :link_url, :weight, :parent_id]

  def find_resources
    menu.items.top_level.ordered
  end

  def menu
    @menu ||= params[:menu_id] && Menu.find(params[:menu_id]) || menu_item.menu
  end

  def after_building_resource
    @menu_item.menu_id = menu.id
  end

  def return_path
    admin_menu_items_path menu
  end
end
