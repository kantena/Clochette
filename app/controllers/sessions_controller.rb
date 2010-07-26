class SessionsController < ApplicationController
  
  def new
    @developpers = Developper.all
  end
  
  def update
    if (Developper.exists?(params[:id]))
      session[:developper] = params[:id].to_i
      redirect_to activity_notes_url
    else
      redirect_to login_url
    end
  end
end
