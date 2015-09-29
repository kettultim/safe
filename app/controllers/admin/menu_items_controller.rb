class Admin::MenuItemsController < Admin::ResourcesController
  resource(
    type: 'menu_item',
    klass: MenuItem,
    allow: [:link_label, :link_url, :weight, :parent_id]
  )

  def load_resources_for_index
    @menu_items = menu.items.top_level.ordered
  end

  def menu
    @menu ||=
      if params[:menu_id]
        Menu.find(params[:menu_id])
      else
        menu_item.menu
      end
  end

  def after_build_resource
    @menu_item.menu_id = menu.id
  end

  def admin_resources_path
    admin_menu_items_path(menu)
  end
end
