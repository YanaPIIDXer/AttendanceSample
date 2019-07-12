class BackToTopController < ApplicationController

    def logout
        # セッションを破棄.
        session[:userName] = nil
        session[:userId] = nil
        session[:adminName] = nil
        
        # トップページへリダイレクト
        redirect_to "/main"
    end
    
end
