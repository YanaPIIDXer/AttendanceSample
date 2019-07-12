class UserManageController < AdminPageBaseController
  def index
    if redirectToErrorPageWhenNotLogin
      return
    end

    @users = User.all
  end

  def create
    userName = params[:userName]
    passWord = params[:passWord]
    salaryId = params[:salaryId]
    if !userName || !passWord || userName.empty? || passWord.empty?
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
  
  def change
    userId = params[:userId]
    salaryId = params[:salaryId]

    @changeUser = User.find_by(id: userId)
    if !@changeUser.update(SalaryId: salaryId)
      redirect_to "/user_manage", :alert => "時給の変更に失敗しました。"
      return
    end
    redirect_to "/user_manage", :notice => "時給を変更しました。"
  end

  def delete
    userId = params[:userId]
    User.find_by(id: userId).delete
    redirect_to "/user_manage", :notice => "削除しました。"
  end
  
end
