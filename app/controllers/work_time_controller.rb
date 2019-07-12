class WorkTimeController < ApplicationController

    def attendance
        redirect_to "/user_main", :notice => "出勤しました。"
    end

    def leave
        redirect_to "/user_main", :notice => "退勤しました。"
    end
    
end
