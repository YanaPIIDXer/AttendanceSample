class UserMainController < ApplicationController
  
  def index
    currentTime = DateTime.now
    prevMonthTime = currentTime << 1
    @prevMonthSalary = calcMonthlySalary(prevMonthTime.year, prevMonthTime.month)
    @currentMonthSalary = calcMonthlySalary(currentTime.year, currentTime.month)
  end

private

  def calcMonthlySalary(year, month)
    salary = 0
    monthStart = DateTime.new(year, month, 1, 0, 0, 0)
    monthEnd = monthStart.end_of_month

    range = monthStart..monthEnd
    workTimes = WorkTime.where(startTime: range)

    workTimes.each do |workTime|
      if !workTime.EndTime
        break
      end

      minute = ((workTime.EndTime - workTime.StartTime).second / 60).floor
      hour = (minute / 60).floor
      salary += (hour * workTime.HourlySalary) + (minute * (workTime.HourlySalary / 60))
    end

    return salary
  end

end
