class UserLoginController < ApplicationController
  
  def index
    if session[:userName]
      redirect_to "/user_main"
    end
  end
  
end
