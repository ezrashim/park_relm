class ChangeColumnsInUsers < ActiveRecord::Migration
  def up
    change_column(:users, :first_name, :string, null: false)
    change_column(:users, :last_name, :string, null: false)
    remove_column(:users, :admin)
  end

  def down
    change_column(:users, :first_name, :string)
    change_column(:users, :last_name, :string)
    add_column(:users, :admin, :boolean, default: false)
  end
end
