module SessionsHelper

  def cur_user
    @cur_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !cur_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    sessions.delete(:user_id)
    @cur_user = nil
  end
end
