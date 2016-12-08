class ApplicationController < ActionController::Base
  helper_method :xeditable?, :date_format
  protect_from_forgery with: :exception

	def xeditable? object = nil
	  true
	end

	def date_format(date, title) 
		 date.strftime("#{title} el %m/%d/%Y a las %I:%M:%S%p")
	end
end
