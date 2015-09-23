module AdminHelper
  def menu_item_select(current_item)
    menu = current_item.menu

    items = menu.nested_items

    result = []

    menu.nested_items.each do |item|
      insert_item_and_children(result, item)
    end

    result
  end

  def insert_item_and_children(array, item)
    prefix = ''

    item[0].level.times do
      prefix << '---'
    end

    array << ["#{prefix}#{item[0].link_label}", item[0].id]

    item[1].each do |child|
     insert_item_and_children(array, child)
    end
  end

  def layout_select
    LAYOUTS.to_a
  end

  def admin_table_tag
    '<table class="table table-bordered table-striped">'.html_safe
  end

  def admin_form_for(object, *args, &block)
    options = args.extract_options!

    simple_form_for(
      object,
      *(args << options.merge(builder: AdminFormBuilder)),
      &block
    )
  end

  def admin_fields_for(object, *args, &block)
    options = args.extract_options!

    simple_fields_for(
      object,
      *(args << options.merge(builder: AdminFormBuilder)),
      &block
    )
  end
end
