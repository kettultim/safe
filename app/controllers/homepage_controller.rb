class HomepageController < ApplicationController
  def index
    @available_countries = Space.available_countries
  end
end
