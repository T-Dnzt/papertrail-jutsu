class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def require_user
    redirect_to new_session_path unless current_user
  end
end
