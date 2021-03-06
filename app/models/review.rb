class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :park

  has_many :votes

  validates :title, presence: true
  validates :body, presence: true

  validates :user_id, presence: true
  validates :park_id, presence: true
end
