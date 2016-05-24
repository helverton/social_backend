class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  
  before_action :set_default_response_format


  private

	def set_default_response_format
	  request.format = :json
	end

end