class UserManageController < ApplicationController
  def index
  end

  def create
    userName = params[:userName]
    passWord = params[:passWord]
    salaryId = params[:salaryId]
    if userName.empty? || passWord.empty?
      redirect_to "/user_manage", :alert => "ユーザ名かパスワードが入力されていません。"
      return
    end

    @addUser = User.create(UserName: userName, PassWord: passWord, SalaryId: salaryId)
    if !@addUser.save
      redirect_to "/user_manage", :alert => "追加に失敗しました。"
      return
    end
    
    redirect_to "/user_manage", :notice => "追加しました。"
  end
  
end
