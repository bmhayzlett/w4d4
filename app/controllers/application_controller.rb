class ApplicationController < ActionController::Base
  helper_method :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def login!(user)
    new_token = user.reset_session_token!
    session[:token] = new_token
  end

  def logout!

  end

  def logged_in?
    !!current_user
  end

end
