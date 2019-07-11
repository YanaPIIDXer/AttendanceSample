class LoginController < ApplicationController
  protect_from_forgery

  # TODO:何かPOSTの設定が根本的におかしい気がする・・・。

  def index
    userName = params[:UserName]
    passWord = params[:PassWord]

    if userName.empty? || passWord.empty?
      redirect_to action: 'emptyinput'
      return
    end

    # ↓POSTとしてブン投げられたメソッドではセッションが正しく保存できない模様。
    #session[:userName] = userName

    # ↓仕方ないので一旦GETパラメータで投げてそこで保存する。
    redirect_to action: 'success', userName: userName
  end

  # POSTとしてブン投げられたアクション内からリダイレクトしようとすると、
  # redirect_toメソッドで設定したflashが消失してしまう模様。
  # GETの場合は問題ないようなので、リダイレクト専用のGET専用アクションを定義する事で対処する。

  def success
    session[:userName] = params[:userName]
    redirect_to "/main/index", notice: "ようこそ、#{session[:userName]}さん。"
  end

  def emptyinput
    redirect_to "/main/index", alert: "ユーザ名かパスワードが入力されていません。"
  end

end
