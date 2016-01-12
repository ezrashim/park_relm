class AddVoteCountColumn < ActiveRecord::Migration
  def change
    add_column :reviews, :vote_count, :integer, default: 0
  end
end
