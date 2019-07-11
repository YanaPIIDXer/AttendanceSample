class SalaryManageController < ApplicationController
  
  def index
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
    @removeSalary = Salary.find(params[:salaryId]).delete
    redirect_to '/salary_manage', :notice => "削除しました。"
  end

end
