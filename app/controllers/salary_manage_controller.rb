class SalaryManageController < AdminPageBaseController
  
  def index
    if redirectToErrorPageWhenNotLogin
      return
    end
  end

  def create
    hourlySalary = params[:HourlySalary]
    if !hourlySalary || hourlySalary.empty?
      redirect_to '/salary_manage', :alert => "正しく時給を入力してください。"
      return
    end
    
    @addSalary = Salary.new(:HourlySalary => hourlySalary.to_i)
    if !@addSalary.save
      redirect_to '/salary_manage', :alert => "追加に失敗しました。"
      return
    end

    redirect_to '/salary_manage', :notice => "追加しました。"
  end

  def delete
    @users = User.find_by(SalaryId: params[:salaryId])
    if @users && !@users.update(SalaryId: 1)
      redirect_to '/salary_manage', :notice => "削除に失敗しました。"
      return
    end
    Salary.find(params[:salaryId]).delete
    redirect_to '/salary_manage', :notice => "削除しました。"
  end

end
