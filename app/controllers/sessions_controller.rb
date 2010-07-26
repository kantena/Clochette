class SessionsController < ApplicationController
  
  def new
    @users = User.all
  end
  
  def update
    if (User.exists?(params[:id]))
      session[:user] = params[:id].to_i
      user = User.find params[:id]
      if user.is_developper?
        redirect_to activity_notes_url
      else
        redirect_to home_url
      end
    else
      redirect_to login_url
    end
  end
end
