class Park < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
end
