class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :reviews
  has_many :parks
  has_many :votes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def admin?
    role == "admin"
  end
end
