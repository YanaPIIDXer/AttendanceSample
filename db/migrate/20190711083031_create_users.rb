class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :UserName
      t.string :PassWord
      t.integer :SalaryId, default: 0
      t.integer :CurrentWorkTimeId, default: 0
    end
  end
end
