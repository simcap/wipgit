class MeController < ApplicationController

  def show
    @user = User.find(session[:user_id])
  end

end
