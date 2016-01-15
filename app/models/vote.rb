class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :vote, presence: true
  validates :vote, numericality: { only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 1 }
  validates :user_id, presence: true
  validates :review_id, presence: true
end
