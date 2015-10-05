class HostDashboardsController < ApplicationController
  def show
    @spaces = current_user.spaces.all
  end
end
