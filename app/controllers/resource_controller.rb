class ResourceController < ApplicationController
  include ResourceAccessor

  before_filter :load_and_authorize_resources, only: [:index]

  before_filter only: [:new, :create] do
    build_and_authorize_resource resource_params
  end

  before_filter only: [:edit, :update, :destroy, :show] do
    load_and_authorize_resource params[:id]
  end

  def self.crud klass = nil, attr: nil, param_key: nil, attributes: []
    configure_resource klass, attr: attr
    define_method(:allowed_params) { attributes }
    define_method(:resource_param_key) { param_key || resource_attr }
  end

  def index; end
  def show;  end
  def new;   end
  def edit;  end

  def create
    if resource.save
      flash[:success] = "The #{resource_attr} as been created."
      on_creation_success
    else
      flash.now[:danger] = "The #{resource_attr} could not be created."
      on_creation_failure
    end
  end

  def on_creation_success
    redirect_to return_path
  end

  def on_creation_failure
    render :new
  end

  def update
    if resource.update_attributes(resource_params)
      redirect_to return_path, success: "The #{resource_attr} has been updated."
    else
      flash.now[:danger] = "The #{resource_attr} could not be updated."
      render :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to return_path, success: "The #{resource_attr} has been deleted."
  end

  private

  def return_path
    send "admin_#{resource_attr.to_s.pluralize}_path"
  end

  def resource_params
    return {} unless params[resource_param_key]

    before_processing_parameters
    parameters
  end

  def before_processing_parameters; end

  def parameters
    params.require(resource_param_key).permit allowed_params
  end

  # ResourceAccessor overrides

  def authorize_resource
    authorize resource
  end

  def authorize_resources
    authorize resources
  end

  def find_resources
    resource_class.page params[:page]
  end
end
