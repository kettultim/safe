class Admin::ResourcesController < ApplicationController
  before_filter :load_and_authorize_resource, only: [:edit, :update, :destroy]
  before_filter :build_and_authorize_resource, only: [:new, :create]

  def self.resource type:, klass:, friendly: false, allow: []
    send :attr_accessor, type
    send :attr_accessor, type.to_s.pluralize

    define_method :allowed_params do
      allow
    end

    define_method :friendly? do
      friendly
    end

    define_method :resource_type do
      type
    end

    define_method :resource_class do
      klass
    end

    define_method :admin_resources_path do
      send("admin_#{resource_type.to_s.pluralize}_path")
    end
  end

  def index
    load_resources_for_index
    authorize resources
  end

  def new
  end

  def create
    if resource.save
      redirect_to admin_resources_path, success: "The #{resource_type} as been created."
    else
      flash.new[:danger] = "The #{resource_type} could not be created."
    end
  end

  def edit
  end

  def update
    if resource.update_attributes(resource_params)
      redirect_to(
        admin_resources_path,
        success: "The #{resource_type} has been updated."
      )
    else
      flash.new[:danger] = "The #{resource_type} could not be updated."
      render :edit
    end
  end

  def destroy
    resource.destroy

    redirect_to(
      admin_resources_path,
      success: "The #{resource_type} has been deleted."
    )
  end

  private

  def load_resources_for_index
    self.resources = resource_class.page params[:page]
  end

  def resource_params
    return {} if params[resource_type] == nil

    before_assigning_parameters
    parameters
  end

  def before_assigning_parameters
  end

  def parameters
    params.require(resource_type).permit allowed_params
  end

  def resources
    send resource_type.pluralize
  end

  def resources= value
    send "#{resource_type.pluralize}=", value
  end

  def resource
    send resource_type
  end

  def resource= value
    send "#{resource_type}=", value
  end

  def load_and_authorize_resource
    if friendly?
      self.resource = resource_class.friendly.find(params[:id])
    else
      self.resource = resource_class.find(params[:id])
    end

    authorize resource
  end

  def build_and_authorize_resource
    self.resource = resource_class.new(resource_params)
    after_build_resource
    authorize resource
  end

  def after_build_resource
  end
end
