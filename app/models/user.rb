class User < ActiveRecord::Base
  has_many :reviews
  has_many :parks, through: :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admin"
  end
end
