class AdminController < ApplicationController
  def index
    authorize :admin, :access?
  end
end
