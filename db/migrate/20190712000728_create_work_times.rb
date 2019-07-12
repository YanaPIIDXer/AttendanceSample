class CreateWorkTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :work_times do |t|
      t.integer :UserId
      t.datetime :StartTime
      t.datetime :EndTime
      t.integer :HourlySalary
    end
  end
end
