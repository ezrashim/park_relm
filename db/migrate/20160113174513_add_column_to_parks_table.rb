class AddColumnToParksTable < ActiveRecord::Migration
  def change
    add_column(:parks, :user_id, :integer, null: false)
  end
end
