class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :park
  validates :title, presence: true
  validates :body, presence: true

  validates :user_id, presence: true
  validates :park_id, presence: true
end
