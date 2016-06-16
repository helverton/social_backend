class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render :json => {:success => "save"}.to_json, :status => 200  
    else
      render :json => {:error => "not-work"}.to_json, :status => 403
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end