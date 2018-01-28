class StaticSiteController < ApplicationController
  before_action :redirect_logged_in

  layout false

  private

  def redirect_logged_in
    redirect_to current_user if user_signed_in?
  end
end
