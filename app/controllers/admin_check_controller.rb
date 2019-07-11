class AdminCheckController < ApplicationController

    def index
        userName = params[:session][:userName]
        passWord = params[:session][:passWord]

        if userName.empty? || passWord.empty?
            backToLoginForm("ユーザ名かパスワードを入力してください。")
            return
        end

        if !Admin.isValid?(userName, passWord)
            backToLoginForm("ユーザ名かパスワードが間違っています。")
            return
        end

        session[:userName] = userName

        # 仮
        redirect_to "/admin_login", :alert => "ユーザ名：#{userName}"
    end

private

    def backToLoginForm(alertMessage)
        redirect_to "/admin_login", :alert => alertMessage
    end

end
