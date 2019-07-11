class AdminCheckController < ApplicationController

    def index
        userName = params[:session][:userName]
        passWord = params[:session][:passWord]

        if(userName.empty? || passWord.empty?)
            redirect_to "/admin_login", :alert => "ユーザ名かパスワードを入力してください。"
            return
        end

        # 仮
        redirect_to "/admin_login", :alert => "ユーザ名：#{userName}"
    end

end
