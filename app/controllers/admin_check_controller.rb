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

        session[:adminName] = userName

        redirect_to "/admin_main"
    end

private

    def backToLoginForm(alertMessage)
        redirect_to "/admin_login", :alert => alertMessage
    end

end
