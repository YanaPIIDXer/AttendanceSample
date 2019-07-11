class LoginController < ApplicationController
  protect_from_forgery

  def index
    userName = params[:session][:userName]
    passWord = params[:session][:passWord]

    if userName.empty? || passWord.empty?
      redirect_to "/main/index", alert: "ユーザ名かパスワードが入力されていません。"
      return
    end

    # ↓POSTとしてブン投げられたメソッドではセッションが正しく保存できない模様。
    session[:userName] = userName

    # ↓仕方ないので一旦GETパラメータで投げてそこで保存する。
    redirect_to "/main/index", notice: "ようこそ、#{session[:userName]}さん。"
  end

end
