class PagesController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    @page = Page.friendly.find(params[:id])
    authorize @page

    if !@page.published?
      flash.now[:warning] = %{This page is not published. It is only visible to
      admin users.}
    end
  end

  private

  def user_not_authorized
    redirect_to root_path, danger: 'Page not found.'
  end
end
