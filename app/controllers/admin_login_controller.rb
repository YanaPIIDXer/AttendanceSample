class AdminLoginController < ApplicationController
	
	def index
		if session[:adminName]
			redirect_to "/admin_main"
		end
	end

end
