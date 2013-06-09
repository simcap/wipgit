class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_authentication

  def current_user
    User.find(session[:user_id])
  end

  def check_authentication
    unless session[:user_id]
      redirect_to new_session_url
    end
  end
end
