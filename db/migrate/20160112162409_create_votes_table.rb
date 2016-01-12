class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote, default: 0
      t.integer :user_id, null: false
      t.integer :review_id, null: false

      t.timestamps null: false
    end
  end
end
