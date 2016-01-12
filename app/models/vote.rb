class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :vote, presence: true
  validates :user_id, presence: true
  validates :review_id, presence: true
end
