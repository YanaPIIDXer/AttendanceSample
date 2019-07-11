class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :UserName
      t.string :PassWord
    end
  end
end
