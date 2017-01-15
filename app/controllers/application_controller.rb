class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ConstantsHelper

  def user_logged_in
    if !logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

end
