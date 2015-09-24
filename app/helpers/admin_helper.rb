module AdminHelper
  def menu_item_select(current_item)
    menu = current_item.menu

    result = []

    menu.items.top_level.ordered.each do |item|
      next if item == current_item
      result << [item.link_label, item.id]
    end

    result
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
