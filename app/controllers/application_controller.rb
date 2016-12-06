class ApplicationController < ActionController::Base
  helper_method :xeditable?
  protect_from_forgery with: :exception
  
	def xeditable? object = nil
	  true # Or something like current_user.xeditable?
	end
end
