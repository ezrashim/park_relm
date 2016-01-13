class Park < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :location, presence: true
end
