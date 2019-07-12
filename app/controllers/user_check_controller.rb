class UserCheckController < ApplicationController

    def index
        userName = params[:session][:userName]
        passWord = params[:session][:passWord]

        if userName.empty? || passWord.empty?
            backToLoginForm("ユーザ名かパスワードを入力してください。")
            return
        end

        user = User.find_by(UserName: userName, PassWord: passWord)
        if user == nil
            backToLoginForm("ユーザ名かパスワードが間違っています。")
            return
        end

        session[:userName] = userName
        session[:userId] = user.id

        redirect_to "/user_main"
    end

    private

    def backToLoginForm(alertMessage)
        redirect_to "/user_login", :alert => alertMessage
    end

end
