class SessionsController < ApplicationController

  skip_before_filter :check_authentication, :only => [:new, :create]

  def new
  end

  def create
    session[:user_id] = User.authenticate(params[:username], params[:password]).id
    flash[:notice] = "You're in!"
    redirect_to me_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url
  end
end
