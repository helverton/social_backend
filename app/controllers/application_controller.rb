class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :set_default_response_format
  
    
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if (current_user.nil?)
      render :json => {:error => "unauthorized"}.to_json, :status => 401
    end
  end

  private

	def set_default_response_format
	  request.format = :json
	end

end
