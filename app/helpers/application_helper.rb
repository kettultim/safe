module ApplicationHelper
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
