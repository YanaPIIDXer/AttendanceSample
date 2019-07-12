class ChangeSalaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :salaries, :IsActive, :boolean
  end
end
