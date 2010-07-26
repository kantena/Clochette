class SessionsController < ApplicationController
  
  def new
    @users = User.all
  end
  
  def update
    if (User.exists?(params[:id]))
      session[:user] = params[:id].to_i
      redirect_to activity_notes_url
    else
      redirect_to login_url
    end
  end
end
