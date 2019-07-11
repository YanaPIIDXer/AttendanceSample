class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.integer :HourlySalary
      t.boolean :IsActive, default: true
    end
  end
end
