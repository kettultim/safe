class AdminFormBuilder < SimpleForm::FormBuilder
  def input(attribute_name, options = {}, &block)
    options[:input_html] ||= {}
    options[:input_html].merge! class: 'form-control'
    super
  end
end
