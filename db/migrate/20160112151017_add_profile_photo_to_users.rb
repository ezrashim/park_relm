class AddProfilePhotoToUsers < ActiveRecord::Migration
  def up
    remove_column(:users, :avatar_url)
    add_column(:users, :profile_photo, :string)
  end

  def down
    remove_column(:users, :profile_photo)
    add_column(:users, :avatar_url, :string)
  end
end
