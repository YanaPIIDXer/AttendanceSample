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
      errorMessage = "追加に失敗しました。"
      if @addUser.errors[:UserName]
        errorMessage = "同じ名前のアルバイトは登録できません。"
      end
      redirect_to "/user_manage", :alert => errorMessage
      return
    end
    
    redirect_to "/user_manage", :notice => "追加しました。"
  end
  
end
