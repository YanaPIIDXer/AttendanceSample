class AdminPageBaseController < ApplicationController

protected

    # ログインしていなければエラーページにリダイレクトする。
    # リダイレクト時はtrueを返す。
    def redirectToErrorPageWhenNotLogin
        if !session[:adminName]
            redirect_to "/error"
            return true
        end
        return false
    end

end
