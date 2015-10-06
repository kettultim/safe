module ResourceAccessor
  extend ActiveSupport::Concern

  class_methods do
    def configure_resource klass = nil, attr: nil

      begin
        klass = controller_name.classify.constantize unless klass
      rescue
      end

      attr = klass.name.demodulize.underscore unless attr

      send :attr_accessor, attr
      send :attr_accessor, attr.to_s.pluralize

      define_method(:resource_attr) { attr }
      define_method(:resource_class) { klass }
    end
  end

  private

  def resource_friendly?
    defined?(FriendlyId) && resource_class.ancestors.include?(FriendlyId::Model)
  end

  def resources
    send resource_attr.pluralize
  end

  def resources= value
    send "#{resource_attr.pluralize}=", value
  end

  def resource
    send resource_attr
  end

  def resource= value
    send "#{resource_attr}=", value
  end

  def load_resources
    self.resources = find_resources
  end

  def load_and_authorize_resources
    load_resources
    authorize_resources
  end

  def find_resources
    resource_class.all
  end

  def load_resource(id)
    self.resource = find_resource id
    after_loading_resource
  end

  def load_and_authorize_resource(id)
    load_resource id
    authorize_resource
  end

  def find_resource(id)
    if resource_friendly?
      resource_class.friendly.find id
    else
      resource_class.find id
    end
  end

  def build_resource(params)
    self.resource = resource_class.new params
    after_building_resource
  end

  def build_and_authorize_resource(params)
    build_resource params
    authorize_resource
  end

  def authorize_resource; end
  def authorize_resources; end
  def after_loading_resource; end
  def after_building_resource; end
end
