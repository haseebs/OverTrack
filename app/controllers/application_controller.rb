class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ConstantsHelper
  include StatsHelper
  include HeroStatsHelper
  include MapStatsHelper
  #helper :constants

  def user_logged_in
    if !logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

end
