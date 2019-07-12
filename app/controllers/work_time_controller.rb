class WorkTimeController < ApplicationController

    def attendance
        currentTime = DateTime.now
        user = User.find(session[:userId])
        if !user
            redirect_to "/user_main", :alert => "出勤処理に失敗しました。"
            return
        end

        if user.CurrentWorkTimeId != 0
            redirect_to "/user_main", :alert => "既に出勤しています。"
            return
        end

        salary = Salary.find(user.SalaryId)
        if !salary
            redirect_to "/user_main", :alert => "出勤処理に失敗しました。"
            return
        end

        hourlySalary = salary.HourlySalary

        workTime = WorkTime.create(StartTime: currentTime, HourlySalary: hourlySalary)
        if !workTime.save
            redirect_to "/user_main", :alert => "出勤処理に失敗しました。"
            return
        end

        user.update(CurrentWorkTimeId: workTime.id)
        if !user.save
            redirect_to "/user_main", :alert => "出勤処理に失敗しました。"
            return
        end

        redirect_to "/user_main", :notice => "出勤しました。"
    end

    def leave
        currentTime = DateTime.now
        user = User.find(session[:userId])
        if !user
            redirect_to "/user_main", :alert => "退勤処理に失敗しました。"
            return
        end

        if user.CurrentWorkTimeId == 0
            redirect_to "/user_main", :alert => "まだ出勤していません。"
            return
        end

        workTime = WorkTime.find(user.CurrentWorkTimeId)
        if !workTime
            redirect_to "/user_main", :alert => "退勤処理に失敗しました。"
            return
        end

        workTime.update(EndTime: currentTime)
        if !workTime.save
            redirect_to "/user_main", :alert => "退勤処理に失敗しました。"
            return
        end

        user.update(CurrentWorkTimeId: 0)
        if !user.save
            redirect_to "/user_main", :alert => "退勤処理に失敗しました。"
            return
        end

        redirect_to "/user_main", :notice => "退勤しました。"
    end
    
end
