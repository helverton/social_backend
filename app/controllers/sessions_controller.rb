class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render :json => {:success => "login"}.to_json, :status => 200  
    else
      render :json => {:error => "not-work"}.to_json, :status => 403
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => {:success => "logout"}.to_json, :status => 200
  end

end